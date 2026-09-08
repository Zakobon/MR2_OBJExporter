/// @desc Builds and returns a sprite sequence based on the given pattern(asset,sprite)
/// The sprite sequence will be comprised of segments that use the supplied TIM's: x y width height 
/// Each segment will have three layers: color_g bg, color_g 1, color_g 2 
/// All layers are drawn as pure white($FFFFFF) pixels on a transparent background
///		(actual color_g is applied when drawn outside this script)
/// - Note: First frame is blank, don't know how to fix yet
/// @arg {asset.sprite} pattern Pattern that will be used for drawing. Must have three layers/frames
/// @arg {real} variant The pattern variant to use
/// @arg {list} tim_list The TIMs that the segments will be based on
/// @arg {list} tim_list The TIMs that the segments will be based on
/// @return {array}

function sprite_builder_pattern(_pattern, _variant, _tim_list){
	var surf = -1;
	var gx = 0;
	var gy = 0;
	var gw = 0;
	var gh = 0;
	var mult = 0;//Bit_mode: x/width modifier
	var scale = 0;//Scale of the drawn pattern, based on the smaller of width and height
	var g_sprite = - 1;
	var t_sprite = - 1;
	sprite_out = [];
	var tim = -1;
	draw_set_alpha(1);
	
	var clut = -1;
	var c_index = c_seq;
	var color_g = [0, 0, 0];
	var color_t = [0, 0, 0];
	var background = 0;
	
	var start_4bit = true;//Flag to identify first frame of created sprite
	var start_8bit = true;
	var sprite_temp = -1;//Holds sprite data to use in sprite_replace when creating first frame
	
	surf = surface_create(2048, 512);
	surface_set_target(surf);
	
	draw_set_alpha(1);
	draw_set_colour($D0D0D0);
	draw_rectangle(0, 0, 1023, 255, false);
	draw_set_colour($FFFFFF);
	draw_rectangle(1024, 0, 2047, 255, false);

	for (var a = 0; a < ds_list_size(_tim_list); a++){
		tim = _tim_list[|a];
		gx = tim.pixel_x - 768;
		gp = gx div 64;
		gy = tim.pixel_y - 256;
		gw = tim.pixel_w;
		gh = tim.pixel_h;
		
		switch (tim.bit){
			case 0:
			mult = 4;
			c_index = c_seq[0];
			clut = grid_data_clut4bit;
			background = 6;
			cap = 21;
			break;
			
			case 1:
			mult = 2;
			c_index = c_seq[1];
			clut = grid_data_clut8bit;
			background = 14;
			gx += gp * 64;
			gx += 512;
			cap = 105;
			break;
		}
		if (gh < (gw * mult)){
			scale = 1 + (gh div 15);
		}
		else{
			scale = 1 + ((gw * mult) div 15);
		}
		if (scale > 5){
			scale = 5;
		}
		color_g[0] = clut[background];
		color_g[1] = clut[c_index[a mod cap] & 0b1111];
		color_g[2] = clut[c_index[a mod cap] >> 4];
		
		//tex_builder() will read the red value of the pixel for index
		color_t[0] = make_colour_rgb(background, background, background);
		color_t[1] = make_colour_rgb(c_index[a mod cap] & 0b1111, c_index[a mod cap] & 0b1111, c_index[a mod cap] & 0b1111);
		color_t[2] = make_colour_rgb(c_index[a mod cap] >> 4, c_index[a mod cap] >> 4, c_index[a mod cap] >> 4);
		scale_offset = 1 / scale;
		//g_sprite
		for (var b = 0; b < 3; b++){ //once for each "layer"
			draw_sprite_part_ext(_pattern, (_variant * 3) + b, 0, 0, (gw * mult) * scale_offset, gh * scale_offset, gx * mult, gy, scale, scale, color_g[b], 1);
			draw_sprite_part_ext(_pattern, (_variant * 3) + b, 0, 0, (gw * mult) * scale_offset, (gh * scale_offset), gx * mult, gy + 256, scale, scale, color_t[b], 1);
		}
		//t_sprite
	}
	
	
	#region Alpha writing
	gpu_set_colourwriteenable(false,false,false,true);
	gpu_set_blendequation(bm_eq_min);
	draw_sprite(grid_sprites[0][0], 0, 0, 0);
	gpu_set_colourwriteenable(true,true,true,true);
	gpu_set_blendequation(bm_eq_add);
	#endregion
	
	g_sprite = sprite_create_from_surface(surf, 0, 0, 2048, 256, false, false, 0, 0);
	t_sprite = sprite_create_from_surface(surf, 0, 256, 2048, 256, false, false, 0, 0);
	sprite_out = [sprite_duplicate(g_sprite), sprite_duplicate(t_sprite)];
	
	sprite_delete(g_sprite);
	sprite_delete(t_sprite);
	
	surface_reset_target();
	surface_free(surf);
	return sprite_out;
}