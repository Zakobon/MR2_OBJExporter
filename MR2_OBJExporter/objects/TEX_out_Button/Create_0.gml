globalvar ui_name_tex;
ui_name_tex = "None";
globalvar tex_buffer;
tex_buffer = -1;

//exported png filepaths for vram28-31
globalvar PNG_28; 
PNG_28 = "";
globalvar PNG_29;
PNG_29 = "";
globalvar PNG_30;
PNG_30 = "";
globalvar PNG_31;
PNG_31 = "";

export_tex = instance_create_layer(out_TIM.left, out_TIM.top, "UI_Draw", Select_Button_32x32);
variable_instance_set(export_tex, "image_index", 0);
variable_instance_set(export_tex, "display", "Export PNG");
variable_instance_set(export_tex, "image", 0);
variable_instance_set(export_tex, "enable", 0);