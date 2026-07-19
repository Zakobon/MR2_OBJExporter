var ChangePath = variable_instance_get(changepath, "active");

if (ChangePath == 1){
	variable_instance_set(changepath, "active", 0);
	user_input = get_directory_alt("Choose Export Folder", user_filepath);
	if (user_input != "") {
		user_filepath = user_input;	
		user_filepath_given = true;
		obj_out_success = false;
		obj_duplicate = 0;
		png_out_success = false;
		png_duplicate = 0;
		tex_out_success = false;
		tex_duplicate = 0;
	}
}