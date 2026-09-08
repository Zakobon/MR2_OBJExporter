/// @desc Takes a TIM and returns an array of pixel indices.
/// Returns: pixel_array[{real}]
/// <If a returned index is 512, it's a fully transparent pixel>
/// - pixel_array = (CLUT Index << 1) + (STP bit | 0b1)
/// Example:
/// -[index 5 + semi_transparent:1, ...] -> [(5 << 1) + (1 | 0b1), ...] -> [(10) + (1), ...] -> [11, ...]
/// @arg {struct} tim Target TIM to supply parameters
/// @arg {boolean} grid_enable If true, exports as a grid pattern // Default: false
/// @arg {real} clut1 CLUT index of first pattern color // Default: 13
/// @arg {real} clut2 CLUT index of second pattern color // Default: 14
/// @arg {real} background CLUT index of background pattern color // Default: 15
/// @arg {real} grid_pattern Grid pattern on export // Default: 0 [Blended]
/// @arg {real} pattern_variant Grid pattern variant to draw from // Default: 0
/// @return {array} pixel_array

function pixel_builder(_tim, _grid_enable = false, _clut1 = 13, _clut2 = 14, _background = 15, _grid_pattern = 0, _pattern_variant = 0){
	var tim = _tim;
	var c1 = _clut1;
	var c2 = _clut2;
	var bg1 = _background;
	
	var scale = 12; //height and width get divided by scale to determine pixel size
	
	var pixel_array = []; //[0-511] or [512]
	// 0bxxxx_xxxx_xxx1 = stp bit //[0-1]
	// 0bxxx1_1111_111x = index //[0-255 << 1] or [1-510]
	// 0bxx10_0000_0000 = Fully Transparent Pixel [512]
	
	var bit = tim.bit;
	
	switch (bit){
		case 0:
		mult = 4;
		break;
		
		case 1:
		mult = 2;
		break;
	}
	
	var width = tim.pixel_w;
	var height = tim.pixel_h;
	
	#region Calculate Pixel size for Grid
	var pix_size = 4; //Scale of the grid pixels
	var grid_line = 16; //x,y mod position of grid lines, 0 = line
	if (_grid_pattern == 0){
		pix_size = 1;
	}
	else{
		switch (width < height){
			case true:
			pix_size = 1 + (width div scale);
			break;
			
			case false:
			pix_size = 1 + (height div scale);
			break;
		}
	}
	#endregion
	
	pixel = 0;
	index = tim.pixel_data;//array [real]
	clut = tim.clut_data;//array [struct]
	switch (_grid_enable){
		case false:
		for (var i = 0; i < height * (width * mult); i++){
			if (clut[index[i]].red + clut[index[i]].green + clut[index[i]].blue + clut[index[i]].stp == 0){
				array_push(pixel_array, 512); //fully transparent bit
			}
			else{
				pixel = clut[index[i]].stp & 0b1;
				pixel = pixel | index[i] << 1;
				array_push(pixel_array, pixel)
			}
		}
		break;
		
		case true:
		var h = 0;
		var w = 0;
		b_num = sprite_get_width(Blended8x8);
		z2_num = sprite_get_width(ZigZag4x4); 
		z_num = sprite_get_width(ZigZag6x6);
		w_num = sprite_get_width(Weave4x4);
		t_num = sprite_get_width(Tile4x4);
		for (var i = 0; i < height * (width * mult); i++){
			if (w >= (width * mult)){
				w = 0;
				h++;
			}
			if (clut[index[i]].red + clut[index[i]].green + clut[index[i]].blue + clut[index[i]].stp == 0){
				array_push(pixel_array, 512); //fully transparent bit
			}
			else{
				pixel = clut[index[i]].stp & 0b1;
				if (!(h mod grid_line) || !((w) mod grid_line)){
					pixel = pixel | (bg1 << 1);
				}
				else{
					switch (_grid_pattern){
						case 0:
						ind = g_pattern.blended[_pattern_variant][(h div pix_size) mod b_num][((w) div pix_size) mod b_num];
						break;
		
						case 1:
						ind = g_pattern.zigzag1[_pattern_variant][(h div pix_size) mod z_num][((w) div pix_size) mod z_num];
						break;
		
						case 2:
						ind = g_pattern.weave[_pattern_variant][(h div pix_size) mod w_num][((w) div pix_size) mod w_num];
						break;
		
						case 3:
						ind = g_pattern.tile[_pattern_variant][(h div pix_size) mod t_num][((w) div pix_size) mod t_num];
						break;
					}
					switch (ind){
						case 0:
						pixel = pixel | (_clut1 << 1)
						break;
						
						case 1:
						pixel = pixel | (_clut2 << 1)
						break;
						
						case 2:
						pixel = pixel | (_background << 1)
						break;
					}
				}
				array_push(pixel_array, pixel);
			}
			w++;
		}
		break;
	
	}
	
	return pixel_array;
}