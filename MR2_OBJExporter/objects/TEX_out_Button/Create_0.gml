globalvar tex_out_success;
tex_out_success = false;
globalvar tex_duplicate;
tex_duplicate = 0;

huh = ["", " ...you're just saving the same file over itself...", " ?", " ???", " why?"]

export_tex = instance_create_layer(x, y, "UI_Draw", Select_Button_24x24);
variable_instance_set(export_tex, "image_index", 0);
variable_instance_set(export_tex, "display", "Export TEX[Grid]");
variable_instance_set(export_tex, "image", 0);
variable_instance_set(export_tex, "enable", 0);