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
	bit_string = ["_4Bit","_8Bit"];
	grid_string = ["","G"];
	for (var a = 1; a < 2; a++){ //unused, was meant to go once for each transparency mode
		#region PNG 8Bit Export
		if (draw_check28_4bit[a] == true){
			switch (grid_mode){
				case 0:
				PNG_28 = string("{0}{1}_vram28_4bit.png", user_filepath, filename);
				surface_save(vram28_4bit[a], PNG_28);
				break;
				
				case 1:
				PNG_28 = string("{0}{1}_vram28_4bitG.png", user_filepath, filename);
				surface_save(vram28_4bit[4], PNG_28);
				break;
			}
		}
		if (draw_check29_4bit[a] == true){
			switch (grid_mode){
				case 0:
				PNG_29 = string("{0}{1}_vram29_4bit.png", user_filepath, filename);
				surface_save(vram29_4bit[a], PNG_29);
				break;
				
				case 1:
				PNG_29 = string("{0}{1}_vram29_4bitG.png", user_filepath, filename);
				surface_save(vram29_4bit[4], PNG_29);
				break;
			}
		}
		if (draw_check30_4bit[a] == true){
			switch (grid_mode){
				case 0:
				PNG_30 = string("{0}{1}_vram30_4bit.png", user_filepath, filename);
				surface_save(vram30_4bit[a], PNG_30);
				break;
				
				case 1:
				PNG_30 = string("{0}{1}_vram30_4bitG.png", user_filepath, filename);
				surface_save(vram30_4bit[4], PNG_30);
				break;
			}
		}
		if (draw_check31_4bit[a] == true){
			switch (grid_mode){
				case 0:
				PNG_31 = string("{0}{1}_vram31_4bit.png", user_filepath, filename);
				surface_save(vram31_4bit[a], PNG_31);
				break;
				
				case 1:
				PNG_31 = string("{0}{1}_vram31_4bitG.png", user_filepath, filename);
				surface_save(vram31_4bit[4], PNG_31);
				break;
			}
		}
		#endregion
		#region PNG 8Bit Export
		if (draw_check28_8bit[a] == true){
			switch (grid_mode){
				case 0:
				PNG_28 = string("{0}{1}_vram28_8Bit.png", user_filepath, filename);
				surface_save(vram28_8bit[a], PNG_28);
				break;
				
				case 1:
				PNG_28 = string("{0}{1}_vram28_8BitG.png", user_filepath, filename);
				surface_save(vram28_8bit[4], PNG_28);
				break;
			}
		}
		if (draw_check29_8bit[a] == true){
			switch (grid_mode){
				case 0:
				PNG_29 = string("{0}{1}_vram29_8Bit.png", user_filepath, filename);
				surface_save(vram29_8bit[a], PNG_29);
				break;
				
				case 1:
				PNG_29 = string("{0}{1}_vram29_8BitG.png", user_filepath, filename);
				surface_save(vram29_8bit[4], PNG_29);
				break;
			}
		}
		if (draw_check30_8bit[a] == true){
			switch (grid_mode){
				case 0:
				PNG_30 = string("{0}{1}_vram30_8Bit.png", user_filepath, filename);
				surface_save(vram30_8bit[a], PNG_30);
				break;
				
				case 1:
				PNG_30 = string("{0}{1}_vram30_8BitG.png", user_filepath, filename);
				surface_save(vram30_8bit[4], PNG_30);
				break;
			}
		}
		if (draw_check31_8bit[a] == true){
			switch (grid_mode){
				case 0:
				PNG_31 = string("{0}{1}_vram31_8Bit.png", user_filepath, filename);
				surface_save(vram31_8bit[a], PNG_31);
				break;
				
				case 1:
				PNG_31 = string("{0}{1}_vram31_8BitG.png", user_filepath, filename);
				surface_save(vram31_8bit[4], PNG_31);
				break;
			}
		}
		#endregion
	}
	variable_instance_set(export_tex, "active",0);
	png_out_success = true;
	png_duplicate++;
}