timer = 0;
globalvar draw_tmd_view;
draw_tmd_view = 0;

globalvar draw_tmd_zoom;
draw_tmd_zoom = 1.0;
globalvar draw_tmd_pan_x;
draw_tmd_pan_x = 0;
globalvar draw_tmd_pan_y;
draw_tmd_pan_y = 0;


hold = 0;

window = Sub_View;

pan_x_start = 0;
pan_y_start = 0;
last_pan_x = 0;
last_pan_y = 0;

x_m = instance_create_layer(window.left + ((window.width) / 2) - 14, window.top + window.height + 4, "UI_Draw", Arrow_Button_24x24);
variable_instance_set(x_m, "image_xscale", -1);
x_p = instance_create_layer(window.left + ((window.width) / 2) + 16, window.top + window.height + 4, "UI_Draw", Arrow_Button_24x24);
variable_instance_set(x_p, "image_xscale", 1);

