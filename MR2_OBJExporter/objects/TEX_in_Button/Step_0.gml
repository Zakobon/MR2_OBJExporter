var Import_TEX = variable_instance_get(import_tex, "active");
if (Import_TEX == 1) {
	old_file = ui_name_tex;
	variable_instance_set(import_tex, "active", 0);
	
	if (instance_exists(ImportTIM)){
		with(ImportTIM) instance_destroy();
		if (surface_exists(draw_ui_clut)){
			surface_free(draw_ui_clut);
		}
		
		//UI reset
		
		grid_mode28 = [0, 0, 0];
		grid_mode29 = [0, 1, 0];
		grid_mode30 = [0, 2, 0];
		grid_mode31 = [0, 3, 0];
		
		draw_check28_4bit = false;
		draw_check28_8bit = false;
		draw_check29_4bit = false;
		draw_check29_8bit = false;
		draw_check30_4bit = false;
		draw_check30_8bit = false;
		draw_check31_4bit = false;
		draw_check31_8bit = false;
		
		PageModeTIM = { 
			vram28 : 2,
			vram29 : 2,
			vram30 : 2,
			vram31 : 2
		}
		for (var a = 0; a < array_length(tim_rgb_clut); a++){
			for (var b = 0; b < array_length(tim_rgb_clut[a]); b++){
				tim_rgb_clut[a][b][0] = 0;
				tim_rgb_clut[a][b][1] = 0;
			}
		}
		for (var a = 0; a < array_length(grid_sprites); a++){
			for (var b = 0; b < array_length(grid_sprites[a]); b++){
				if (sprite_exists(grid_sprites[a][b])){
					sprite_delete(grid_sprites[a][b]);
					grid_sprites[a][b] = -1;
				}
			}
		}
		for (var a = 0; a < 8; a++){
			vram28_4bit[a][0] = -1;
			vram29_4bit[a][0] = -1;
			vram30_4bit[a][0] = -1;
			vram31_4bit[a][0] = -1;
	
			vram28_8bit[a][0] = -1;
			vram29_8bit[a][0] = -1;
			vram30_8bit[a][0] = -1;
			vram31_8bit[a][0] = -1;
			
			draw_check28_4bit = false;
			draw_check29_4bit = false;
			draw_check30_4bit = false;
			draw_check31_4bit = false;

			draw_check28_8bit = false;
			draw_check29_8bit = false;
			draw_check30_8bit = false;
			draw_check31_8bit = false;
		}
		instance_create_layer(0, 0, "TIM_Draw", ImportTIM);
	}
	else{
		instance_create_layer(0, 0, "TIM_Draw", ImportTIM);
	}
	
	if (user_filepath_given == false){
		if (filepath == ""){
			for (var a = 0; a < array_length(filename_array) - 1;a++){
				filepath = string_insert(string(filename_array[a] + "\\"), filepath, string_length(filepath) + 1);
			}
			user_filepath = variable_clone(filepath);
		}
	}
	
	draw_refresh = draw_refresh | 0b1;
	png_out_success = false;
	png_duplicate = 0;
	tex_out_success = false;
	tex_duplicate = 0;
	obj_out_success = 0;
	obj_duplicate = 0;
	variable_instance_set(Visibility_UI, "update", true);
	
}