globalvar grid_mode;
grid_mode = 0;

grid_button = instance_create_layer(x, y, "UI_Draw", Select_Button_24x24);
variable_instance_set(grid_button, "display", "Enable Grid Export");
variable_instance_set(grid_button, "toggle_set", 1);