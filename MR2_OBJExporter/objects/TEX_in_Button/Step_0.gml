var Import_TEX = variable_instance_get(import_tex, "active");
if (Import_TEX == 1) {
	if (instance_exists(ImportTIM)){
		with(ImportTIM) instance_destroy();
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
	
	png_out_success = false;
}