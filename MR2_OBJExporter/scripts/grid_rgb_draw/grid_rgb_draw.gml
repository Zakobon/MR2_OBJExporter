/// @description Takes a color and returns the sprite of a colored grid
/// Modes:
/// 0:Flat
/// 1:Dragon Scale
/// 2:Flower
/// @param {Real} w The width of the grid
/// @param {Real} h The height of the grid
/// @param {Array} clut The clut the grid will draw from
/// @param {Real} alpha The alpha of the sprite
/// @param {Real} count Current iteration of function
/// @param {Real} mult Mult value for width. Default:2
/// @param {Real} [grid_size] Block Size of grid, border line included. Default:8
/// @param {Real} [grid_mode] Grid pattern used. Default:0
/// @return {Asset.GMSprite} New sprite asset
function grid_rgb_draw(_width, _height, _clut, _bg_index, _count, _mult = 2, _grid_mode = 0, _grid_size = 4){
	temp_surface = surface_create(_width, _height);
	new_sprite = -1;
	clut = _clut;
	grid_size = _grid_size;
	width = _width;
	height = _height;
	
	thin = 0;
	//pix_size = 4;
	w = 0;
	h = 0;
	maxbit = array_length(_clut);
	var max_index = 12;
	index = _count;

	count1 = index mod max_index;
	count2 = count1 + (((index div 6)) mod (max_index - count1));
	//count1 = (count1) mod max_index;
	//count2 = (count2 * 3) mod (max_index);
	//count2 = 3 + ((count2) mod (max_index - 3));
	if (count1 == count2){
		count1 = 4 + (count1 mod (max_index - 4));
	}
	c1 = clut[count1]
	c2 = clut[count2]
	//if (count1 < count2){
	//	bg1 = clut[_bg_index - (1)];
	//}
	//else{
	//	bg1 = clut[_bg_index];
	//}
	bg2 = clut[_bg_index - 1];
	bg1 = clut[_bg_index];
	//if (count1 == 0){
	//	count1++;
	//}
	//if (count2 == 0){
	//	count2++;
	//}
	//if (count1 == count2){
	//	count1 = (count1 + 1) mod 16;
	//	if (count1 == 0){
	//		count1++;
	//	}
	//}

	surface_set_target(temp_surface);
	draw_clear_alpha(c_white, 0);
	//draw_sprite_stretched_ext(_sprite, _subimg, 0, 0, _width, _height, c_white, _alpha);
	//draw_sprite_ext(Grid1_256x256, _grid, 0, 0, 1, 1, 0, _color, _alpha);
	
	switch(width > height){
		case true:
		pix_size = 1 + height div 15;
		break;
		
		case false:
		pix_size = 1 + width div 15;
		break;
	}
	switch (_grid_mode){//Grid Builder
		case 0:
		#region 0:Blended
		//1212
		//2121
		//1212
		//2121
	
		//c1 = clut[(count1) mod max_index];
		//c2 = clut[(count2 * 3) mod (max_index)];
		if (c1 == c2){
			c1 = (c1 + 1) mod (max_index -1);
		}
		//if (true){
		//	bg1 = c2;
		//}
		bg1 = clut[_bg_index];
		for (var i = 0; i < (width * mult) * height; i++){
			switch (h % 2){
				case 0:
				if (w % 2 == 0){
					draw_set_colour(c1);
				}
				else{
					draw_set_colour(c2);
				}
				break;
			
				case 1:
				if (w % 2 == 1){
					draw_set_colour(c1);
				}
				else{
					draw_set_colour(c2);
				}
				break;

				default:
				break;
			}
			//if !(h mod (grid_size * 4) && w mod (grid_size * 4)){
			//	draw_set_colour(bg1);
			//}
			//if ((w div pix_size) mod grid_size < 1){
			//	draw_set_colour(bg1);
			//}
			//if ((h div pix_size) mod grid_size < 1){
			//	draw_set_colour(bg2);
			//}
			if (w mod (grid_size * pix_size) == 0){
				draw_set_colour(bg1);
			}

			if (h mod (grid_size * pix_size) == 0){
				draw_set_colour(bg1);
			}
			draw_point(0 + w, 0 + h)
			w++;
			if (w >= width * 2){
				w = 0;
				h++;
			}
		}
		#endregion
		break;
		case 1:
		#region 1:ZigZag
		//
		//c1 = clut[(count1) mod max_index]
		//c2 = clut[(count2 * 3) mod (max_index)]
		for (var i = 0; i < (width * mult) * height; i++){
			switch ((h div pix_size) % grid_size){
				case 0:
				if ((w div pix_size) % grid_size == 0){
					draw_set_colour(c1);
				}
				else{
					draw_set_colour(c2);
				}
				break;
			
				case 1:
				if ((w div pix_size) % grid_size == 1){
					draw_set_colour(c2);
				}
				else{
					draw_set_colour(c1);
				}
				break;
			
				case 2:
				if ((w div pix_size) % grid_size == 2){
					draw_set_colour(c1);
				}
				else{
					draw_set_colour(c2);
				}
				break;
			
			
			
				case 3:
				if ((w div pix_size) % grid_size == 3){
					draw_set_colour(c2);
				}
				else{
					draw_set_colour(c1);
				}
				break;

				default:
				break;
			}
			if (w mod (grid_size * pix_size) == 0){
				draw_set_colour(bg1);
			}

			if (h mod (grid_size * pix_size) == 0){
				draw_set_colour(bg1);
			}
			draw_point(0 + w, 0 + h)
			w++;
			if (w >= width * 2){
				w = 0;
				h++;
			}
		}
		#endregion
		break
		case 2:
		#region 2:Weave
		//0101
		//2122
		//0101
		//2221

		for (var i = 0; i < (width * mult) * height; i++){
			switch ((h div pix_size) % grid_size){
				case 0:
				case 2:
				if ((w div pix_size) % 2 == 0){
					draw_set_colour(bg1);
				}
				else{
					draw_set_colour(c1);
				}
				break;
			
				case 1:
				if ((w div pix_size) % grid_size == 1){
					draw_set_colour(c1);
				}
				else{
					draw_set_colour(c2);
				}
				break;
			
				case 3:
				if ((w div pix_size) % grid_size == 3){
					draw_set_colour(c1);
				}
				else{
					draw_set_colour(c2);
				}
				break;

				default:
				break;
			}
			if (w mod (grid_size * pix_size) == 0){
				draw_set_colour(bg1);
			}

			if (h mod (grid_size * pix_size) == 0){
				draw_set_colour(bg1);
			}
			draw_point(0 + w, 0 + h)
			w++;
			if (w >= width * 2){
				w = 0;
				h++;
			}
		}
		#endregion
		break;
		case 3:
		#region 3:Tile
		//1210
		//2120
		//1210
		//0000
	
		//c1 = clut[(count1) mod max_index]
		//c2 = clut[(count2 * 3) mod (max_index)]
		for (var i = 0; i < (width * mult) * height; i++){
			switch ((h div pix_size) % grid_size){
				case 0:
				switch ((w div pix_size) % grid_size){
					case 0:
					draw_set_colour(c1);
					break;
					case 1:
					draw_set_colour(c2);
					break;
					case 2:
					draw_set_colour(c1);
					break;
					case 3:
					draw_set_colour(c1);
					break;
				}
				break;
				
				case 1:
				switch ((w div pix_size) % grid_size){
					case 0:
					draw_set_colour(c2);
					break;
					case 1:
					draw_set_colour(c1);
					break;
					case 2:
					draw_set_colour(c2);
					break;
					case 3:
					draw_set_colour(c2);
					break;
				}
				break;
			
				case 2:
				switch ((w div pix_size) % grid_size){
					case 0:
					draw_set_colour(c1);
					break;
					case 1:
					draw_set_colour(c2);
					break;
					case 2:
					draw_set_colour(c1);
					break;
					case 3:
					draw_set_colour(c1);
					break;
				}
				break;
			
				case 3:
				switch ((w div pix_size) % grid_size){
					case 0:
					draw_set_colour(c1);
					break;
					case 1:
					draw_set_colour(c2);
					break;
					case 2:
					draw_set_colour(c1);
					break;
					case 3:
					draw_set_colour(c2);
					break;
				}
				break;

				default:
				draw_set_colour(bg1);
				break;
			}
			if (w mod (grid_size * pix_size) == 0){
				draw_set_colour(bg1);
			}

			if (h mod (grid_size * pix_size) == 0){
				draw_set_colour(bg1);
			}
			draw_point(0 + w, 0 + h)
			w++;
			if (w >= width * 2){
				w = 0;
				h++;
			}
		}
		#endregion
		break;
	}
	surface_reset_target();
    view_surface_id[0] = temp_surface;
	new_sprite = sprite_create_from_surface(temp_surface, 0, 0, _width, _height, false, false, 0, 0);
	surface_free(temp_surface);
	return new_sprite;
}