adv_options.timbuilder = variable_instance_get(export_mode, "selection");
if (mm0_hash != -1){
	var Export_active = variable_instance_get(export_mm0, "active");

	variable_instance_set(export_mm0, "enable", 1);
	if (Export_active == 1){
		variable_instance_set(export_mm0, "active", 0);
		switch(adv_options.timbuilder){
			case false:
			export_obj();
			break;
			case true:
			if (tex_hash != -1 && mm0_hash != -1){
				timb_prim();//builds timb_tmd
				export_timb();
			}
			else{
				show_message("You need to import both a model(.MMX/.MMJ) and a texture(.TEX) to build and export an OBJ in TIMBuilder style");
				exit;
			}
			break;
		}
		obj_out_success = 1;
		obj_duplicate++;
	}
}
else{
	variable_instance_set(export_mm0, "enable", 0);
	exit;
}
if (last_mode != adv_options.timbuilder){
	last_mode = adv_options.timbuilder;
	obj_out_success = 0;
	obj_duplicate = 0;
	png_out_success = 0;
	png_duplicate = 0;
}