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
	alarm[0] = 1;
}