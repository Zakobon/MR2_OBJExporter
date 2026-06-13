var semi_transparency_active = variable_instance_get(semi_transparency, "active");
var transparency_active = variable_instance_get(transparency, "active");

var semi_transparency_toggle = variable_instance_get(semi_transparency, "toggle");
var transparency_toggle = variable_instance_get(transparency, "toggle");
if (ds_list_size(tim_list) != 0){
	variable_instance_set(semi_transparency, "enable", 1);
	variable_instance_set(transparency, "enable", 1);
}
else{
	variable_instance_set(semi_transparency, "enable", 0);
	variable_instance_set(transparency, "enable", 0);
}
if (semi_transparency_active == 1){
	view_semitransparency = semi_transparency_toggle;
	variable_instance_set(semi_transparency, "active", 0);
	draw_refresh = 1;
}

if (transparency_active == 1){
	view_transparency = transparency_toggle;
	variable_instance_set(transparency, "active", 0);
	draw_refresh = 1;
}