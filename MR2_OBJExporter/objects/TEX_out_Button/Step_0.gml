var export_tex_active = variable_instance_get(export_tex, "active");

if (instance_exists(ImportTIM)){
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

	filename = get_save_filename_ext("TEX File|*.tex", filename, user_filepath, "Export Grid TEX as");
	if (filename != ""){
		buffer_save(tex_buffer, filename);
	
		tex_out_success = true;
		tex_duplicate++;
	}
}