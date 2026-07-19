globalvar ui_name_tex;
ui_name_tex = "None";
globalvar tex_buffer;
tex_buffer = -1;

//exported png filepaths for vram28_opaque-31
globalvar PNG_28; 
PNG_28 = "";
globalvar PNG_29;
PNG_29 = "";
globalvar PNG_30;
PNG_30 = "";
globalvar PNG_31;
PNG_31 = "";

globalvar PNG_Grid; 
PNG_Grid = false;

globalvar png_duplicate; //tracks the number of duplicate exports to display, so you know it's still doing something
png_duplicate = 0;

export_png = instance_create_layer(out_PNG.left, out_PNG.top, "UI_Draw", Select_Button_32x32);
variable_instance_set(export_png, "image_index", 0);
variable_instance_set(export_png, "display", "Export PNG");
variable_instance_set(export_png, "image", 0);
variable_instance_set(export_png, "enable", 0);