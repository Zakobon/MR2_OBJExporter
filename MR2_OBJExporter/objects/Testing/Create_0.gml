
//sprite = grid_rgb_draw(40, 64, c_white, 1, 0);

test_button = instance_create_layer(x, y, "UI_Draw", Select_Button_16x16);
variable_instance_set(test_button, "display", "Test Button");
count = 0;
reverse = false;
vmax = 232;
vmin = 32;
step = 1.5;
timer = 0;