var Export_TEX = variable_instance_get(export_tex, "active");

if (ui_name_tex != "None"){
	variable_instance_set(export_tex, "enable", 1);
}
else{
	variable_instance_set(export_tex, "enable", 0);
	exit;
}
if (Export_TEX == 1){
	//if (ds_list_size(tim_list) != 0){
	//	tex_builder();
	//	if (ui_name_tex != ""){
	//		export_path = get_save_filename_ext("PSX TEX|*.tex", ui_name_tex, "","Save PSX TEX File");
	//	}
	//	else{
	//		export_path = get_save_filename_ext("PSX TEX|*.tex", "xx_xx", "","Save PSX TEX File");
	//	}
	//	buffer_save(tex_buffer, export_path);
	//}
	filename = string_delete(ui_name_tex, string_length(ui_name_tex) - 3, 4);
	
	t_mode = ["opaque", "semi-transparent"];
	for (var a = 0; a < 2; a++){
		if (draw_check28[a] == true){
			PNG_28 = string("{0}{1}_vram28.png", user_filepath, filename);
			surface_save(vram28[a], PNG_28);
		}
		if (draw_check29[a] == true){
			PNG_29 = string("{0}{1}_vram29.png", user_filepath, filename);
			surface_save(vram29[a], PNG_29);
		}
		if (draw_check30[a] == true){
			PNG_30 = string("{0}{1}_vram30.png", user_filepath, filename);
			surface_save(vram30[a], PNG_30);
		}
		if (draw_check31[a] == true){
			PNG_31 = string("{0}{1}_vram31.png", user_filepath, filename);
			surface_save(vram31[a], PNG_31);
		}
	}
	variable_instance_set(export_tex, "active",0);
	png_out_success = true;
	png_duplicate++;
}