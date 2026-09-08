// TEX Export Button
// made as an alarm so that it
// runs after drawing a single frame to
// allow a loading sprite to be drawn 
// onto screen 
// tex_builder() line 45: 
// tex_grid_builder(); <- takes a few seconds to complete
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