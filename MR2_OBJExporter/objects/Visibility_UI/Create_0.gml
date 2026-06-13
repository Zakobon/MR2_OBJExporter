semi_transparency = instance_create_layer(x, y, "UI_Draw", Select_Button_24x24);
variable_instance_set(semi_transparency, "display", "View Semi-Transparency");
variable_instance_set(semi_transparency, "enable", 0);
variable_instance_set(semi_transparency, "image", 0);
variable_instance_set(semi_transparency, "toggle_set", 1);

transparency = instance_create_layer(x, y + 32, "UI_Draw", Select_Button_24x24);
variable_instance_set(transparency, "display", "View Transparency");
variable_instance_set(transparency, "enable", 0);
variable_instance_set(transparency, "image", 0);
variable_instance_set(transparency, "toggle_set", 1);