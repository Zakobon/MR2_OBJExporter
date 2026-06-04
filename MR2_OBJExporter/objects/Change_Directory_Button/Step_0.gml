var ChangePath = variable_instance_get(changepath, "active");

if (ChangePath == 1){
	user_filepath = get_directory_alt("Choose Export Folder", user_filepath);
	variable_instance_set(changepath, "active", 0);
	user_filepath_given = true;
}