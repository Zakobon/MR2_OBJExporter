var Export_active = variable_instance_get(export_timb_button, "active");

if (tex_hash != -1 && mm0_hash != -1){
	variable_instance_set(export_timb_button, "enable", 1);
}
else{
	variable_instance_set(export_timb_button, "enable", 0);
	exit;
}

if (Export_active == 1){
	variable_instance_set(export_timb_button, "active", 0);
	
	timb_prim();	
	timb_tim();
	
	export_timb();
}