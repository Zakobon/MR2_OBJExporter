apply = 0;
image_index = 0;
timer = 0;
surf = -1;



tex_hash_old = -1;
mm0_hash_old = -1;

export_status = ["File not found", "File Found", "Exported!"];

//export_timb_button = instance_create_layer(out_OBJ.left, out_OBJ.top, "UI_Draw", Select_Button_32x32);
export_timb_button = instance_create_layer(x, y, "UI_Draw", Select_Button_32x32);
variable_instance_set(export_timb_button, "image_index", 0);
variable_instance_set(export_timb_button, "display", "Export TIMBuilder");
variable_instance_set(export_timb_button, "image", 0);
variable_instance_set(export_timb_button, "enable", 0);
