//if (draw_refresh == 0){
//	exit;
//}
if (instance_exists(GetModel)){
	if (prim_refresh == true){
		prim_refresh = false;
		if (surface_exists(surf)){
			surface_free(surf);
		}
		surf = surface_create(2048,256);
		surface_set_target(surf);
		full_prim_draw(tmd_edit.prim, c_white);
		surface_reset_target()
		for (var a = 0; a < 8; a++){
			if (sprite_exists(prim_sprites[a][1])){
				sprite_delete(prim_sprites[a][1]);
			}
			prim_sprites[a][1] = sprite_create_from_surface(surf, a * 256, 0, 256, 256, false, false, 0, 0);
		}
	}
}

if (ds_list_size(tim_list) != 0 && draw_refresh != 0){
	pattern_total = [
		1,
		frame_info(Blended256x256) div 3,
		frame_info(ZigZag256x256) div 3,
		frame_info(Weave256x256) div 3,
		frame_info(Tile256x256) div 3		
	];
	
	draw_refresh = 0;
	if (!surface_exists(vramback)){ //vram page background for transparency visibility
		draw_set_alpha(1);
		vramback = surface_create(256, 256); 

		surface_set_target(vramback);
		draw_sprite(T_Grid, 0, 0, 0);
		
		surface_reset_target();
		view_surface_id[0] = vramback;
	}
	
	
	#region Draw TIMs to page surfaces
	if (surface_exists(surf)){
		surface_free(surf);
	}
	for (var a = 0; a < ds_list_size(tim_list); a++){
		tim = tim_list[|a];
		bit_mode = tim.bit;
		switch (tim.pixel_x div 64){
			case 12:
			if (bit_mode = 0){
				draw_check28_4bit = true;
			}
			else{
				draw_check28_8bit = true;
			}
			break;
			
			case 13:
			if (bit_mode = 0){
				draw_check29_4bit = true;
			}
			else{
				draw_check29_8bit = true;
			}
			break;
			
			case 14:
			if (bit_mode = 0){
				draw_check30_4bit = true;
			}
			else{
				draw_check30_8bit = true;
			}
			break;
			
			case 15:
			if (bit_mode = 0){
				draw_check31_4bit = true;
			}
			else{
				draw_check31_8bit = true;
			}
			break;
		}
		px = tim.pixel_x - 768;
		pp = px div 64;
		py = tim.pixel_y - 256;
		pw = tim.pixel_w;
		ph = tim.pixel_h;

		switch(bit_mode){ 
			case 0:
			mult = 4;
			break;
					
			case 1:
			mult = 1;
			px += pp * 64;
			px += 512;
			break;
		}
			
		
		#region Create base texture sprites
		if !(surface_exists(surf)){
			surf = surface_create(2048, 256);
			surface_set_target(surf);
			draw_clear_alpha(c_white, 0);
			draw_set_alpha(1);
			draw_set_colour($D0D0D0);
			draw_rectangle(0, 0, 1023, 255, false);
			draw_set_colour($FFFFFF);
			draw_rectangle(1024, 0, 2047, 255, false); //empty space filler
		}
		else{
			surface_set_target(surf);
			//draw_clear_alpha(c_white, 0);
			//draw_set_alpha(1);
			//draw_set_colour($D0D0D0);
			//draw_rectangle(0, 0, 1023, 255, false);
			//draw_set_colour($FFFFFF);
			//draw_rectangle(1024, 0, 2047, 255, false); //empty space filler
		}
		gpu_set_blendenable(false); //try to make alpha values predictable
				
		pixel_list = pixel_builder(tim_list[|a], false, 0, 0, 0, 0, 0);
				
		#region Draw pixels to surface
		w = 0;
		h = 0;
		for (var d = 0; d < array_length(pixel_list); d++){
			index = pixel_list[d] >> 1;
			stp = pixel_list[d] & 0b1;
							
			if (w >= pw * mult){
				w = 0;
				h++;
			}
			#region Alpha setup
			if (pixel_list[d] >= 512){ //fully transparent, "erases" pixel
				gpu_set_blendenable(true);
				draw_set_alpha(1);
				draw_set_colour($FFFFFF);
				gpu_set_blendmode(bm_subtract);
								
				draw_point_colour((px * mult) + w, py + h, $FFFFFF);
								
				gpu_set_blendmode(bm_normal);
				gpu_set_blendenable(false);
								
				w++;
				continue;
			}
			else if (stp == 1){ //semi-transparent
				draw_set_alpha(png_alpha);
			}
			else { //opaque
				draw_set_alpha(1);
			}
			#endregion
								
			#region Pixel Draw
			
			draw_clut = tim_rgb_clut[tim_list[|a].clut_y - 505];
			draw_point_colour((px * mult) + w, py + h, draw_clut[index + tim_list[|a].clut_x][0]);

			#endregion
							
			w++;			
		}	
		
		surface_reset_target();
		view_surface_id[0] = surf;
		#endregion
		
		draw_set_alpha(1);
		gpu_set_blendenable(true);
		#endregion
	}
	grid_sprites[0][0] = sprite_create_from_surface(surf, 0, 0, 2048, 256, false, false, 0, 0);
	#endregion
	
	#region Create Grid sprites
	for (var a = 0; a < 4; a++){
		switch(a){
			case 0:
			pattern = Blended256x256;
			break;
			
			case 1:
			pattern = ZigZag256x256;
			break;
			
			case 2:
			pattern = Weave256x256;
			break;
			
			case 3:
			pattern = Tile256x256;
			break;
		}
		built_sprites = [-1, -1];
		for (var b = 0; b < pattern_total[a + 1]; b++){
			count = 1;
			//array_push(tex_sprites[a], []);
			built_sprites = sprite_builder_pattern(pattern, b, tim_list);
			
			tex_grid[a][b] = sprite_duplicate(built_sprites[1]);

			grid_sprites[a + 1][b] = sprite_duplicate(built_sprites[0]);//grid_sprites[pattern][variant]
			sprite_delete(built_sprites[0]);
			sprite_delete(built_sprites[1]);
		}
	}
	gpu_set_blendenable(true); 
	
	#endregion
}



timer++;
if (timer > 30){
	timer = 0;
}