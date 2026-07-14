var Import_TEX = variable_instance_get(import_tex, "active");
if (Import_TEX == 1) {
	old_file = ui_name_tex;
	variable_instance_set(import_tex, "active", 0);
	if (instance_exists(ImportTIM)){
		with(ImportTIM) instance_destroy();
		if (surface_exists(draw_ui_clut)){
			surface_free(draw_ui_clut);
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
	if (old_file != ui_name_tex){
		for (var a = 0; a < 5; a++){
			if (surface_exists(vram28_8bit[a])){
				surface_free(vram28_8bit[a]);
			}
			draw_check28_4bit[a] = false;
			draw_check28_8bit[a] = false;
			if (surface_exists(vram29_8bit[a])){
				surface_free(vram29_8bit[a]);
			}
			draw_check29_4bit[a] = false;
			draw_check29_8bit[a] = false;
			if (surface_exists(vram30_8bit[a])){
				surface_free(vram30_8bit[a]);
			}
			draw_check30_4bit[a] = false;
			draw_check30_8bit[a] = false;
			if (surface_exists(vram31_8bit[a])){
				surface_free(vram31_8bit[a]);
			}
			draw_check31_4bit[a] = false;
			draw_check31_8bit[a] = false;
		}
		
		for (var a = 0; a < 5; a++){
			vram28_4bit[a] = -1;
			vram29_4bit[a] = -1;
			vram30_4bit[a] = -1;
			vram31_4bit[a] = -1;
	
			vram28_8bit[a] = -1;
			vram29_8bit[a] = -1;
			vram30_8bit[a] = -1;
			vram31_8bit[a] = -1;
			
			draw_check28_4bit[a] = false;
			draw_check29_4bit[a] = false;
			draw_check30_4bit[a] = false;
			draw_check31_4bit[a] = false;

			draw_check28_8bit[a] = false;
			draw_check29_8bit[a] = false;
			draw_check30_8bit[a] = false;
			draw_check31_8bit[a] = false;
		}
		
		png_out_success = false;
		png_duplicate = 0;
		obj_out_success = 0;
		obj_duplicate = 0;
	}
	variable_instance_set(Visibility_UI, "update", true);
}