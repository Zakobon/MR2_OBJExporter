var export_tex_active = variable_instance_get(export_tex, "active");

if (grid_mode == true && instance_exists(ImportTIM)){
	variable_instance_set(export_tex, "enable", 1);
}
else{
	variable_instance_set(export_tex, "enable", 0);
	exit;
}
if (export_tex_active == 1){
	variable_instance_set(export_tex, "active", 0);
	if !(instance_exists(ImportTIM)){
		exit;
	}
	tex_builder();
	filename = string_delete(ui_name_tex, string_length(ui_name_tex) - 3, 4);
	tex_path = string("{0}{1}.tex", user_filepath, filename);
	buffer_save(tex_buffer, tex_path);
	
	tex_out_success = true;
	tex_duplicate++;
}