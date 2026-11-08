var ChangePath = variable_instance_get(changepath, "active");

if (ChangePath == 1){
	variable_instance_set(changepath, "active", 0);
	user_input = get_directory_alt("Choose Export Folder", adv_options.filepath);
	if (user_input != "") {
		adv_options.filepath = user_input;	
		adv_options.user_path_flag = true;
		obj_out_success = false;
		obj_duplicate = 0;
		png_out_success = false;
		png_duplicate = 0;
		tex_out_success = false;
		tex_duplicate = 0;
	}
}