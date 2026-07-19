//if (draw_refresh == 0){
//	exit;
//}

if (ds_list_size(tim_list) != 0){
	if (!surface_exists(vramback)){ //vram page background for transparency visibility
		draw_set_alpha(1);
		vramback = surface_create(256, 256); 
			
		surface_set_target(vramback);
		draw_sprite(T_Grid, 0, 0, 0);
		surface_reset_target();
		view_surface_id[0] = vramback;
	}
	#region Draw 8-bit TIMs to VRAM pages
			//run twice because we only have 2 transparency modes made
			for (var a = 0; a < 4; a++) { 
				switch (a % 2){
					case 0:
					fill = true;
					break;
					case 1:
					fill = false;
					break;
				}
		
				if (!surface_exists(vram28_8bit[a]) || draw_refresh != 0){
					vram28_8bit[a] = surface_create(256, 256);
			
					draw_set_alpha(1);
					surface_set_target(vram28_8bit[a]);
					draw_clear_alpha(c_white, true);
					if (a < 2){
						for (var b = 0; b < ds_list_size(tim_list); b++){
							px = tim_list[|b].pixel_x - 768;
							if (px < 0 || px > 63 || tim_list[|b].bit == 0){
								continue;
							}
							tim_rgb_draw(-768, -256, tim_list[|b], 1, 1, 1, fill);
							draw_check28_8bit[a] = true;
						}
					}
					else{
						switch (view_transparency){
							case false:
							draw_clear_alpha(c_black, true);
							break;
	
							case true:
							draw_surface(vramback, 0, 0);
							break;
						}
						draw_surface(vram28_8bit[a - 2], 0, 0);
					}
					surface_reset_target();
					view_surface_id[0] = vram28_8bit[a];
			
					draw_set_alpha(1);
				}
			} 
			for (var a = 0; a < 4; a++) {
				switch (a % 2){
					case 0:
					fill = true;
					break;
					case 1:
					fill = false;
					break;
				}
				if (!surface_exists(vram29_8bit[a]) || draw_refresh != 0){
					vram29_8bit[a] = surface_create(256, 256);
			
					draw_set_alpha(1);
					surface_set_target(vram29_8bit[a]);
					draw_clear_alpha(c_white, true);
					if (a < 2){
						for (var b = 0; b < ds_list_size(tim_list); b++){
							px = tim_list[|b].pixel_x - 832;
							if (px < 0 || px > 63 || tim_list[|b].bit == 0){
								continue;
							}
							tim_rgb_draw(-832, -256, tim_list[|b], 1, 1, 1, fill);
							draw_check29_8bit[a] = true;
						}
					}
					else{
						switch (view_transparency){
							case false:
							draw_clear_alpha(c_black, true);
							break;
	
							case true:
							draw_surface(vramback, 0, 0);
							break;
						}
						draw_surface(vram29_8bit[a - 2], 0, 0);
					}
					surface_reset_target();
					view_surface_id[0] = vram29_8bit[a];
			
					draw_set_alpha(1);
				}
			}
			for (var a = 0; a < 4; a++) {
				switch (a % 2){
					case 0:
					fill = true;
					break;
					case 1:
					fill = false;
					break;
				}
				if (!surface_exists(vram30_8bit[a]) || draw_refresh != 0){
					vram30_8bit[a] = surface_create(256, 256); 
			
					draw_set_alpha(1);
					surface_set_target(vram30_8bit[a]);
					draw_clear_alpha(c_white, true);
					if (a < 2){
						for (var b = 0; b < ds_list_size(tim_list); b++){
							px = tim_list[|b].pixel_x - 896;
							if (px < 0 || px > 63 || tim_list[|b].bit == 0){
								continue;
							}
							tim_rgb_draw(-896, -256, tim_list[|b], 1, 1, 1, fill);
							draw_check30_8bit[a] = true;
						}
					}
					else{
						switch (view_transparency){
							case false:
							draw_clear_alpha(c_black, true);
							break;
	
							case true:
							draw_surface(vramback, 0, 0);
							break;
						}
						draw_surface(vram30_8bit[a - 2], 0, 0);
					}
					surface_reset_target();
					view_surface_id[0] = vram30_8bit[a];
			
					draw_set_alpha(1);
				}
			}
			for (var a = 0; a < 4; a++) {
				switch (a % 2){
					case 0:
					fill = true;
					break;
					case 1:
					fill = false;
					break;
				}
				if (!surface_exists(vram31_8bit[a]) || draw_refresh != 0){
					vram31_8bit[a] = surface_create(256, 256); 
			
					draw_set_alpha(1);
					surface_set_target(vram31_8bit[a]);
					draw_clear_alpha(c_white, true);
					if (a < 2){
						for (var b = 0; b < ds_list_size(tim_list); b++){
							px = tim_list[|b].pixel_x - 960;
							if (px < 0 || px > 63 || tim_list[|b].bit == 0){
								continue;
							}
							tim_rgb_draw(-960, -256, tim_list[|b], 1, 1, 1, fill);
							draw_check31_8bit[a] = true;
						}
					}
					else{
						switch (view_transparency){
							case false:
							draw_clear_alpha(c_black, true);
							break;
	
							case true:
							draw_surface(vramback, 0, 0);
							break;
						}
						draw_surface(vram31_8bit[a - 2], 0, 0);
					}
					surface_reset_target();
					view_surface_id[0] = vram31_8bit[a];
			
					draw_set_alpha(1);
				}
			}
			draw_refresh = 0;

		//draw grid pages
		if (!surface_exists(vram28_8bit[4]) || draw_refresh != 0){
			vram28_8bit[4] = surface_create(256, 256);
			
			draw_set_alpha(1);
			surface_set_target(vram28_8bit[4]);
			draw_clear_alpha(c_grey, true);
			for (var b = 0; b < ds_list_size(tim_list); b++){
				px = tim_list[|b].pixel_x - 768;
				if (px < 0 || px > 63 || tim_list[|b].bit == 0){
					continue;
				}
				scale = 2;
				//tim_rgb_draw(-768, -256, tim_list[|b], 1, 1, 1, false);
				pos_x = (tim_list[|b].pixel_x - 768) * scale;
				pos_y = tim_list[|b].pixel_y - 256;
				draw_set_colour($FFE0D8);
				draw_rectangle(pos_x, pos_y, pos_x + (tim_list[|b].pixel_w * scale) - 1, pos_y + tim_list[|b].pixel_h - 1, false);
				
				new_grid = grid_rgb_draw((tim_list[|b].pixel_w * scale), tim_list[|b].pixel_h, grid_data_clut4bit, 1, b, scale);
				draw_sprite(new_grid, 0, pos_x, pos_y);
				tim_count++;
				draw_check28_8bit[4] = true;
			}
	
			surface_reset_target();
			view_surface_id[0] = vram28_8bit[4];
			
			draw_set_alpha(1);
			vram28_8bit[4] = alpha_subtract(vram28_8bit[1], vram28_8bit[4]);
		}
		if (!surface_exists(vram29_8bit[4]) || draw_refresh != 0){
			vram29_8bit[4] = surface_create(256, 256);
			
			draw_set_alpha(1);
			surface_set_target(vram29_8bit[4]);
			draw_clear_alpha(c_grey, true);
			for (var b = 0; b < ds_list_size(tim_list); b++){
				px = tim_list[|b].pixel_x - 832;
				if (px < 0 || px > 63 || tim_list[|b].bit == 0){
					continue;
				}
				scale = 2;
				//tim_rgb_draw(-832, -256, tim_list[|b], 1, 1, 1, false);
				pos_x = (tim_list[|b].pixel_x - 832) * scale;
				pos_y = tim_list[|b].pixel_y - 256;
				draw_set_colour($FFE0D8);
				draw_rectangle(pos_x, pos_y, pos_x + (tim_list[|b].pixel_w * scale) - 1, pos_y + tim_list[|b].pixel_h - 1, false);
				
				new_grid = grid_rgb_draw((tim_list[|b].pixel_w * scale), tim_list[|b].pixel_h, grid_data_clut4bit, 1, b, scale);
				draw_sprite(new_grid, 0, pos_x, pos_y);
				tim_count++;
				draw_check29_8bit[4] = true;
			}
	
			surface_reset_target();
			view_surface_id[0] = vram29_8bit[4];
			
			draw_set_alpha(1);
			
			vram29_8bit[4] = alpha_subtract(vram29_8bit[1], vram29_8bit[4]);
		}
		if (!surface_exists(vram30_8bit[4]) || draw_refresh != 0){
			vram30_8bit[4] = surface_create(256, 256);
			
			draw_set_alpha(1);
			surface_set_target(vram30_8bit[4]);
			draw_clear_alpha(c_grey, true);
			for (var b = 0; b < ds_list_size(tim_list); b++){
				px = tim_list[|b].pixel_x - 896;
				if (px < 0 || px > 63 || tim_list[|b].bit == 0){
					continue;
				}
				scale = 2;
				//tim_rgb_draw(-896, -256, tim_list[|b], 1, 1, 1, false);
				pos_x = (tim_list[|b].pixel_x - 896) * scale;
				pos_y = tim_list[|b].pixel_y - 256;
				draw_set_colour($FFE0D8);
				draw_rectangle(pos_x, pos_y, pos_x + (tim_list[|b].pixel_w * scale) - 1, pos_y + tim_list[|b].pixel_h - 1, false);
				
				new_grid = grid_rgb_draw((tim_list[|b].pixel_w * scale), tim_list[|b].pixel_h, grid_data_clut4bit, 1, b, scale);
				draw_sprite(new_grid, 0, pos_x, pos_y);
				tim_count++;
				draw_check30_8bit[4] = true;
			}
	
			surface_reset_target();
			view_surface_id[0] = vram30_8bit[4];
			
			draw_set_alpha(1);
			
			vram30_8bit[4] = alpha_subtract(vram30_8bit[1], vram30_8bit[4]);
		}
		if (!surface_exists(vram31_8bit[4]) || draw_refresh != 0){
			vram31_8bit[4] = surface_create(256, 256);
			
			draw_set_alpha(1);
			surface_set_target(vram31_8bit[4]);
			draw_clear_alpha(c_grey, true);
			for (var b = 0; b < ds_list_size(tim_list); b++){
				px = tim_list[|b].pixel_x - 960;
				if (px < 0 || px > 63 || tim_list[|b].bit == 0){
					continue;
				}
				scale = 2;
				//tim_rgb_draw(-960, -256, tim_list[|b], 1, 1, 1, false);
				pos_x = (tim_list[|b].pixel_x - 960) * scale;
				pos_y = tim_list[|b].pixel_y - 256;
				draw_set_colour($FFE0D8);
				draw_rectangle(pos_x, pos_y, pos_x + (tim_list[|b].pixel_w * scale) - 1, pos_y + tim_list[|b].pixel_h - 1, false);
				
				new_grid = grid_rgb_draw((tim_list[|b].pixel_w * scale), tim_list[|b].pixel_h, grid_data_clut4bit, 1, b, scale);
				draw_sprite(new_grid, 0, pos_x, pos_y);
				tim_count++;
				draw_check31_8bit[4] = true;
			}
	
			surface_reset_target();
			view_surface_id[0] = vram31_8bit[4];
			
			draw_set_alpha(1);
			
			vram31_8bit[4] = alpha_subtract(vram31_8bit[1], vram31_8bit[4]);
		}
		//tim_count = 0;
	#endregion
	#region Draw 4-bit TIMs to VRAM pages
			//run twice because we only have 2 transparency modes made
			for (var a = 0; a < 4; a++) {
				switch (a % 2){
					case 0:
					fill = true;
					break;
					case 1:
					fill = false;
					break;
				}
		
				if (!surface_exists(vram28_4bit[a]) || draw_refresh != 0){
					vram28_4bit[a] = surface_create(256, 256);
			
					draw_set_alpha(1);
					surface_set_target(vram28_4bit[a]);
					draw_clear_alpha(c_white, true);
					if (a < 2){
						for (var b = 0; b < ds_list_size(tim_list); b++){
							px = tim_list[|b].pixel_x - 768;
							if (px < 0 || px > 63 || tim_list[|b].bit == 1){
								continue;
							}
							tim_rgb_draw(-768, -256, tim_list[|b], 1, 1, 1, fill);
							draw_check28_4bit[a] = true;
						}
					}
					else{
						switch (view_transparency){
							case false:
							draw_clear_alpha(c_black, true);
							break;
	
							case true:
							draw_surface(vramback, 0, 0);
							break;
						}
						draw_surface(vram28_4bit[a - 2], 0, 0);
					}
					surface_reset_target();
					view_surface_id[0] = vram28_4bit[a];
			
					draw_set_alpha(1);
				}
			} 
			for (var a = 0; a < 4; a++) {
				switch (a % 2){
					case 0:
					fill = true;
					break;
					case 1:
					fill = false;
					break;
				}
				if (!surface_exists(vram29_4bit[a]) || draw_refresh != 0){
					vram29_4bit[a] = surface_create(256, 256);
			
					draw_set_alpha(1);
					surface_set_target(vram29_4bit[a]);
					draw_clear_alpha(c_white, true);
					if (a < 2){
						for (var b = 0; b < ds_list_size(tim_list); b++){
							px = tim_list[|b].pixel_x - 832;
							if (px < 0 || px > 63 || tim_list[|b].bit == 1){
								continue;
							}
							tim_rgb_draw(-832, -256, tim_list[|b], 1, 1, 1, fill);
							draw_check29_4bit[a] = true;
						}
					}
					else{
						switch (view_transparency){
							case false:
							draw_clear_alpha(c_black, true);
							break;
	
							case true:
							draw_surface(vramback, 0, 0);
							break;
						}
						draw_surface(vram29_4bit[a - 2], 0, 0);
					}
					surface_reset_target();
					view_surface_id[0] = vram29_4bit[a];
			
					draw_set_alpha(1);
				}
			}
			for (var a = 0; a < 4; a++) {
				switch (a % 2){
					case 0:
					fill = true;
					break;
					case 1:
					fill = false;
					break;
				}
				if (!surface_exists(vram30_4bit[a]) || draw_refresh != 0){
					vram30_4bit[a] = surface_create(256, 256); 
			
					draw_set_alpha(1);
					surface_set_target(vram30_4bit[a]);
					draw_clear_alpha(c_white, true);
					if (a < 2){
						for (var b = 0; b < ds_list_size(tim_list); b++){
							px = tim_list[|b].pixel_x - 896;
							if (px < 0 || px > 63 || tim_list[|b].bit == 1){
								continue;
							}
							tim_rgb_draw(-896, -256, tim_list[|b], 1, 1, 1, fill);
							draw_check30_4bit[a] = true;
						}
					}
					else{
						switch (view_transparency){
							case false:
							draw_clear_alpha(c_black, true);
							break;
	
							case true:
							draw_surface(vramback, 0, 0);
							break;
						}
						draw_surface(vram30_4bit[a - 2], 0, 0);
					}
					surface_reset_target();
					view_surface_id[0] = vram30_4bit[a];
			
					draw_set_alpha(1);
				}
			}
			for (var a = 0; a < 4; a++) {
				switch (a % 2){
					case 0:
					fill = true;
					break;
					case 1:
					fill = false;
					break;
				}
				if (!surface_exists(vram31_4bit[a]) || draw_refresh != 0){
					vram31_4bit[a] = surface_create(256, 256); 
			
					draw_set_alpha(1);
					surface_set_target(vram31_4bit[a]);
					draw_clear_alpha(c_white, true);
					if (a < 2){
						for (var b = 0; b < ds_list_size(tim_list); b++){
							px = tim_list[|b].pixel_x - 960;
							if (px < 0 || px > 63 || tim_list[|b].bit == 1){
								continue;
							}
							tim_rgb_draw(-960, -256, tim_list[|b], 1, 1, 1, fill);
							draw_check31_4bit[a] = true;
						}
					}
					else{
						switch (view_transparency){
							case false:
							draw_clear_alpha(c_black, true);
							break;
	
							case true:
							draw_surface(vramback, 0, 0);
							break;
						}
						draw_surface(vram31_4bit[a - 2], 0, 0);
					}
					surface_reset_target();
					view_surface_id[0] = vram31_4bit[a];
			
					draw_set_alpha(1);
				}
			}
			draw_refresh = 0;
		//draw grid pages
		if (!surface_exists(vram28_4bit[4]) || draw_refresh != 0){
			vram28_4bit[4] = surface_create(256, 256);
			
			draw_set_alpha(1);
			surface_set_target(vram28_4bit[4]);
			draw_clear_alpha(c_grey, true);
			for (var b = 0; b < ds_list_size(tim_list); b++){
				px = tim_list[|b].pixel_x - 768;
				if (px < 0 || px > 63 || tim_list[|b].bit == 1){
					continue;
				}
				scale = 4;
				//tim_rgb_draw(-768, -256, tim_list[|b], 1, 1, 1, false);
				pos_x = (tim_list[|b].pixel_x - 768) * scale;
				pos_y = tim_list[|b].pixel_y - 256;
				draw_set_colour($303030);
				draw_rectangle(pos_x, pos_y, pos_x + (tim_list[|b].pixel_w * scale) - 1, pos_y + tim_list[|b].pixel_h - 1, false);
				
				new_grid = grid_rgb_draw((tim_list[|b].pixel_w * scale), tim_list[|b].pixel_h, grid_data_clut4bit, 1, b, scale);
				draw_sprite(new_grid, 0, (tim_list[|b].pixel_x - 768) * scale, tim_list[|b].pixel_y - 256);
				tim_count++;
				draw_check28_4bit[4] = true;
			}
	
			surface_reset_target();
			view_surface_id[0] = vram28_4bit[4];
			
			draw_set_alpha(1);
			vram28_4bit[4] = alpha_subtract(vram28_4bit[1], vram28_4bit[4]);
			
		}
		if (!surface_exists(vram29_4bit[4]) || draw_refresh != 0){
			vram29_4bit[4] = surface_create(256, 256);
			
			draw_set_alpha(1);
			surface_set_target(vram29_4bit[4]);
			draw_clear_alpha(c_grey, true);
			for (var b = 0; b < ds_list_size(tim_list); b++){
				px = tim_list[|b].pixel_x - 832;
				if (px < 0 || px > 63 || tim_list[|b].bit == 1){
					continue;
				}
				scale = 4;
				//tim_rgb_draw(-832, -256, tim_list[|b], 1, 1, 1, false);
				pos_x = (tim_list[|b].pixel_x - 832) * scale;
				pos_y = tim_list[|b].pixel_y - 256;
				draw_set_colour($303030);
				draw_rectangle(pos_x, pos_y, pos_x + (tim_list[|b].pixel_w * scale) - 1, pos_y + tim_list[|b].pixel_h - 1, false);
				
				new_grid = grid_rgb_draw((tim_list[|b].pixel_w * scale), tim_list[|b].pixel_h, grid_data_clut4bit, 1, b, scale);
				draw_sprite(new_grid, 0, pos_x, pos_y);
				tim_count++;
				draw_check29_4bit[4] = true;
			}
	
			surface_reset_target();
			view_surface_id[0] = vram29_4bit[4];
			
			draw_set_alpha(1);
			vram29_4bit[4] = alpha_subtract(vram29_4bit[1], vram29_4bit[4]);
		}
		if (!surface_exists(vram30_4bit[4]) || draw_refresh != 0){
			vram30_4bit[4] = surface_create(256, 256);
			
			draw_set_alpha(1);
			surface_set_target(vram30_4bit[4]);
			draw_clear_alpha(c_grey, true);
			for (var b = 0; b < ds_list_size(tim_list); b++){
				px = tim_list[|b].pixel_x - 896;
				if (px < 0 || px > 63 || tim_list[|b].bit == 1){
					continue;
				}
				scale = 4;
				//tim_rgb_draw(-896, -256, tim_list[|b], 1, 1, 1, false);
				pos_x = (tim_list[|b].pixel_x - 896) * scale;
				pos_y = tim_list[|b].pixel_y - 256;
				draw_set_colour($303030);
				draw_rectangle(pos_x, pos_y, pos_x + (tim_list[|b].pixel_w * scale) - 1, pos_y + tim_list[|b].pixel_h - 1, false);
				
				new_grid = grid_rgb_draw((tim_list[|b].pixel_w * scale), tim_list[|b].pixel_h, grid_data_clut4bit, 1, b, scale);
				draw_sprite(new_grid, 0, pos_x, pos_y);
				tim_count++;
				draw_check30_4bit[4] = true;
			}
	
			surface_reset_target();
			view_surface_id[0] = vram30_4bit[4];
			
			draw_set_alpha(1);
			vram30_4bit[4] = alpha_subtract(vram30_4bit[1], vram30_4bit[4]);
		}
		if (!surface_exists(vram31_4bit[4]) || draw_refresh != 0){
			vram31_4bit[4] = surface_create(256, 256);
			
			draw_set_alpha(1);
			surface_set_target(vram31_4bit[4]);
			draw_clear_alpha(c_grey, true);
			for (var b = 0; b < ds_list_size(tim_list); b++){
				px = tim_list[|b].pixel_x - 960;
				if (px < 0 || px > 63 || tim_list[|b].bit == 1){
					continue;
				}
				scale = 4;
				//tim_rgb_draw(-960, -256, tim_list[|b], 1, 1, 1, false);
				pos_x = (tim_list[|b].pixel_x - 960) * scale;
				pos_y = tim_list[|b].pixel_y - 256;
				draw_set_colour($303030);
				draw_rectangle(pos_x, pos_y, pos_x + (tim_list[|b].pixel_w * scale) - 1, pos_y + tim_list[|b].pixel_h - 1, false);
				
				new_grid = grid_rgb_draw((tim_list[|b].pixel_w * scale), tim_list[|b].pixel_h, grid_data_clut4bit, 1, b, scale);
				draw_sprite(new_grid, 0, pos_x, pos_y);
				tim_count++;
				draw_check31_4bit[4] = true;
			}
	
			surface_reset_target();
			view_surface_id[0] = vram31_4bit[4];
			
			draw_set_alpha(1);
			vram31_4bit[4] = alpha_subtract(vram31_4bit[1], vram31_4bit[4]);
		}
		tim_count = 0;
	#endregion
}
timer++;
if (timer > 30){
	timer = 0;
}