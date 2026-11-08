var export_png_active = variable_instance_get(export_png, "active");

if (ui_name_tex != "None"){
	variable_instance_set(export_png, "enable", 1);
}
else{
	variable_instance_set(export_png, "enable", 0);
	exit;
}

if (export_png_active == 1){
	variable_instance_set(export_png, "active",0);
	switch(adv_options.timbuilder){
		case false:	
		filename = string_delete(ui_name_tex, string_length(ui_name_tex) - 3, 4);

		fname_string = [
		"{0}{1}_vram28_4bit{2}.png",
		"{0}{1}_vram29_4bit{2}.png",
		"{0}{1}_vram30_4bit{2}.png",
		"{0}{1}_vram31_4bit{2}.png",
		"{0}{1}_vram28_8bit{2}.png",
		"{0}{1}_vram29_8bit{2}.png",
		"{0}{1}_vram30_8bit{2}.png",
		"{0}{1}_vram31_8bit{2}.png"
		];
		grid_string = ["","G"];
		png_name = "";
		view = [0,0];
		s_ind = 0;
	
		var surf = -1;
		for (var a = 0; a < 8; a++){
			draw = false;
			if (a < 4){
				s_ind = a + 1;
			}
			else{
				s_ind = a;
			}
			switch (a mod 4){
				case 0:
				png_name = string(fname_string[a], adv_options.user_path, filename, grid_string[grid_mode28[0]]);
				if (PageModeTIM.vram28 & 0b01 == 0){
					view[0] = 0;
					view[1] = 0;
				}
				else{
					view[0] = grid_mode28[1] + 1;
					view[1] = grid_mode28[2];
				}
				switch (a div 4){
					case 0:
					if (draw_check28_4bit == true){
						draw = true;
					}
					x_off = 0;
					break;
					case 1:
					if (draw_check28_8bit == true){
						draw = true;
					}
					x_off = 4 * 256; 
					break;
				}
				break;
				case 1:
				png_name = string(fname_string[a], adv_options.user_path, filename, grid_string[grid_mode29[0]]);
				if (PageModeTIM.vram29 & 0b01 == 0){
					view[0] = 0;
					view[1] = 0;
				}
				else{
					view[0] = grid_mode29[1] + 1;
					view[1] = grid_mode29[2];
				}
				switch (a div 4){
					case 0:
					if (draw_check29_4bit == true){
						draw = true;
					}
					x_off = 1 * 256; 
					break;
					case 1:
					if (draw_check29_8bit == true){
						draw = true;
					}
					x_off = 5 * 256; 
					break;
				}
				break;
				case 2:
				png_name = string(fname_string[a], adv_options.user_path, filename, grid_string[grid_mode30[0]]);
				if (PageModeTIM.vram30 & 0b01 == 0){
					view[0] = 0;
					view[1] = 0;
				}
				else{
					view[0] = grid_mode30[1] + 1;
					view[1] = grid_mode30[2];
				}
				switch (a div 4){
					case 0:
					if (draw_check30_4bit == true){
						draw = true;
					}
					x_off = 2 * 256; 
					break;
					case 1:
					if (draw_check30_8bit == true){
						draw = true;
					}
					x_off = 6 * 256; 
					break;
				}
				break;
				case 3:
				png_name = string(fname_string[a], adv_options.user_path, filename, grid_string[grid_mode31[0]]);
				if (PageModeTIM.vram31 & 0b01 == 0){
					view[0] = 0;
					view[1] = 0;
				}
				else{
					view[0] = grid_mode31[1] + 1;
					view[1] = grid_mode31[2];
				}
				switch (a div 4){
					case 0:
					if (draw_check31_4bit == true){
						draw = true;
					}
					x_off = 3 * 256; 
					break;
					case 1:
					if (draw_check31_8bit == true){
						draw = true;
					}
					x_off = 7 * 256; 
					break;
				}
				break;
			}
			if !(surface_exists(surf)){
				surf = surface_create(256, 256);
				surface_set_target(surf);
			}
			draw_clear_alpha(c_white, 0);
			if (draw == true){//grid_sprites[page][pattern][variant]
				draw_sprite_part(grid_sprites[view[0]][view[1]], 0, x_off, 0, 256, 256, 0, 0);
				surface_save(surf, png_name);
			}
		}
	
		surface_reset_target();
		for (var a = 1; a < 1; a++){ //unused, was meant to go once for each transparency mode
			#region PNG 4Bit Export
			if (draw_check28_4bit == true){
				switch (grid_mode28[0]){
					case 0:
					PNG_28 = string("{0}{1}_vram28_4bit.png", adv_options.user_path, filename);
					surface_save(vram28_4bit[0][0], PNG_28);
					break;
				
					case 1:
					PNG_28 = string("{0}{1}_vram28_4bitG.png", adv_options.user_path, filename);
					surface_save(vram28_4bit[grid_mode28[1] + 1][grid_mode28[2]], PNG_28);
					break;
				}
			}
			if (draw_check29_4bit == true){
				switch (grid_mode29[0]){
					case 0:
					PNG_29 = string("{0}{1}_vram29_4bit.png", adv_options.user_path, filename);
					surface_save(vram29_4bit[0][0], PNG_29);
					break;
				
					case 1:
					PNG_29 = string("{0}{1}_vram29_4bitG.png", adv_options.user_path, filename);
					surface_save(vram29_4bit[grid_mode29[1] + 1][grid_mode29[2]], PNG_29);
					break;
				}
			}
			if (draw_check30_4bit == true){
				switch (grid_mode30[0]){
					case 0:
					PNG_30 = string("{0}{1}_vram30_4bit.png", adv_options.user_path, filename);
					surface_save(vram30_4bit[0][0], PNG_30);
					break;
				
					case 1:
					PNG_30 = string("{0}{1}_vram30_4bitG.png", adv_options.user_path, filename);
					surface_save(vram30_4bit[grid_mode30[1] + 1][grid_mode30[2]], PNG_30);
					break;
				}
			}
			if (draw_check31_4bit == true){
				switch (grid_mode31[0]){
					case 0:
					PNG_31 = string("{0}{1}_vram31_4bit.png", adv_options.user_path, filename);
					surface_save(vram31_4bit[0][0], PNG_31);
					break;
				
					case 1:
					PNG_31 = string("{0}{1}_vram31_4bitG.png", adv_options.user_path, filename);
					surface_save(vram31_4bit[grid_mode31[1] + 1][grid_mode31[2]], PNG_31);
					break;
				}
			}
			#endregion
			#region PNG 8Bit Export
			if (draw_check28_8bit == true){
				switch (grid_mode28[0]){
					case 0:
					PNG_28 = string("{0}{1}_vram28_8Bit.png", adv_options.user_path, filename);
					surface_save(vram28_8bit[0][0], PNG_28);
					break;
				
					case 1:
					PNG_28 = string("{0}{1}_vram28_8BitG.png", adv_options.user_path, filename);
					surface_save(vram28_8bit[grid_mode28[1] + 1][grid_mode28[2]], PNG_28);
					break;
				}
			}
			if (draw_check29_8bit == true){
				switch (grid_mode29[0]){
					case 0:
					PNG_29 = string("{0}{1}_vram29_8Bit.png", adv_options.user_path, filename);
					surface_save(vram29_8bit[0][0], PNG_29);
					break;
				
					case 1:
					PNG_29 = string("{0}{1}_vram29_8BitG.png", adv_options.user_path, filename);
					surface_save(vram29_8bit[grid_mode29[1] + 1][grid_mode29[2]], PNG_29);
					break;
				}
			}
			if (draw_check30_8bit == true){
				switch (grid_mode30[0]){
					case 0:
					PNG_30 = string("{0}{1}_vram30_8Bit.png", adv_options.user_path, filename);
					surface_save(vram30_8bit[0][0], PNG_30);
					break;
				
					case 1:
					PNG_30 = string("{0}{1}_vram30_8BitG.png", adv_options.user_path, filename);
					surface_save(vram30_8bit[grid_mode30[1] + 1][grid_mode30[2]], PNG_30);
					break;
				}
			}
			if (draw_check31_8bit == true){
				switch (grid_mode31[0]){
					case 0:
					PNG_31 = string("{0}{1}_vram31_8Bit.png", adv_options.user_path, filename);
					surface_save(vram31_8bit[0][0], PNG_31);
					break;
				
					case 1:
					PNG_31 = string("{0}{1}_vram31_8BitG.png", adv_options.user_path, filename);
					surface_save(vram31_8bit[grid_mode31[1] + 1][grid_mode31[2]], PNG_31);
					break;
				}
			}
			#endregion
		}
		
		break;

		case true:
		timb_tim();//builds timb_sprite

		if (ui_name_tex != "None"){
			filename = string_delete(ui_name_tex, string_length(ui_name_tex) - 3, 4);
		}
		else{
			filename = string_delete(fname_mm0, string_length(fname_mm0) - 1, 2);
		}
		png_name = string("{0}{1}_timb.png", adv_options.user_path, filename);
		sprite_save(timb_sprite, 0, png_name);		
		break;
	}
	png_out_success = true;
	png_duplicate++;
}