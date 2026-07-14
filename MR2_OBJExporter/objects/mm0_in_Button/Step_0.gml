var Import_MM0 = variable_instance_get(import_mm0, "active");

if (Import_MM0 == 1){
	if (instance_exists(GetModel)){
		with(GetModel) instance_destroy();
		PageModePrim = {
			vram28 : 0,
			vram29 : 0,
			vram30 : 0,
			vram31 : 0,
		}
		instance_create_layer(0, 0, "Vertex_Draw", GetModel);
	}
	else{
		instance_create_layer(0, 0, "Vertex_Draw", GetModel);
	}
	variable_instance_set(import_mm0, "active", 0);
	
	obj_out_success = 0;
	obj_duplicate = 0;
	png_out_success = 0;
	png_duplicate = 0;
	
	if (user_filepath_given == false){
		if (filepath == ""){
			filepath = "";
			for (var a = 0; a < array_length(filename_array) - 1;a++){
				filepath = string_insert(string(filename_array[a] + "\\"), filepath, string_length(filepath) + 1);
			}
			user_filepath = variable_clone(filepath);
		}
	}
	variable_instance_set(Visibility_UI, "update", true);
}