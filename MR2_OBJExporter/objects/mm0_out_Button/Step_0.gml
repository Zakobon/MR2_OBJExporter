
if (mm0_base_buffer != -1){
	var Export_active = variable_instance_get(export_mm0, "active");
	image_index = 0;
	apply = 1;
	variable_instance_set(export_mm0, "enable", 1);
	if (Export_active == 1){
		export_obj();
		variable_instance_set(export_mm0, "active", 0);
		obj_out_success = 1;
		obj_duplicate++;
	}
}
else{
	image_index = 1;
	variable_instance_set(export_mm0, "enable", 0);
	apply = 0;
	exit;
}
switch (grid_mode){
	case false:
	variable_instance_set(export_mm0, "display", "Export OBJ[Norm]");
	break;
	case true:
	variable_instance_set(export_mm0, "display", "Export OBJ[Grid]");
	break;
}