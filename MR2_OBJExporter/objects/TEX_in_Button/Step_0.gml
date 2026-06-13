var Import_TEX = variable_instance_get(import_tex, "active");
if (Import_TEX == 1) {
	if (instance_exists(ImportTIM)){
		with(ImportTIM) instance_destroy();
		if (surface_exists(draw_ui_clut)){
			surface_free(draw_ui_clut);
		}
		instance_create_layer(0, 0, "Vertex_Draw", ImportTIM);
	}
	else{
		instance_create_layer(x + 0, y +  0, "TIM_Draw", ImportTIM);
	}
	variable_instance_set(import_tex, "active", 0);
	
	if (user_filepath_given == false){
		filepath = "";
		for (var a = 0; a < array_length(filename_array) - 1;a++){
			filepath = string_insert(string(filename_array[a] + "\\"), filepath, string_length(filepath) + 1);
		}
		user_filepath = variable_clone(filepath);
	}
	for (var a = 0; a < 2; a++){
		if (surface_exists(vram28[a])){
			surface_free(vram28[a]);
		}
		draw_check28[a] = false;
		if (surface_exists(vram29[a])){
			surface_free(vram29[a]);
		}
		draw_check29[a] = false;
		if (surface_exists(vram30[a])){
			surface_free(vram30[a]);
		}
		draw_check30[a] = false;
		if (surface_exists(vram31[a])){
			surface_free(vram31[a]);
		}
		draw_check31[a] = false;
	}
	
	vram28 = [-1, -1, -1, -1, -1];
	vram29 = [-1, -1, -1, -1, -1];
	vram30 = [-1, -1, -1, -1, -1];
	vram31 = [-1, -1, -1, -1, -1];
	png_out_success = false;
	png_duplicate = 0;
	
}