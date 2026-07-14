image_index = 0;
globalvar tmd_base;
tmd_base = -1;
globalvar tmd_edit;
tmd_edit = -1;
globalvar mm0_base_buffer;
mm0_base_buffer = -1;
globalvar tmd_edit_buffer;
tmd_edit_buffer = -1;
globalvar fname_mm0;
fname_mm0 = "";
globalvar ui_name_mm0;
ui_name_mm0 = "None";
globalvar filepath;
filepath = "";

#region Prim Check Variables
globalvar prim_check28_4bit;
prim_check28_4bit = false;
globalvar prim_check29_4bit;
prim_check29_4bit = false;
globalvar prim_check30_4bit;
prim_check30_4bit = false;
globalvar prim_check31_4bit;
prim_check31_4bit = false;

globalvar prim_check28_8bit;
prim_check28_8bit = false;
globalvar prim_check29_8bit;
prim_check29_8bit = false;
globalvar prim_check30_8bit;
prim_check30_8bit = false;
globalvar prim_check31_8bit;
prim_check31_8bit = false;
#endregion

globalvar obj_out_success; //tracks if export succeded
obj_out_success = 0;

huh = ["", " ?", " ???", " why?", " you're just saving the same file over itself..."]


import_mm0 = instance_create_layer(in_MM0.left, in_MM0.top, "UI_Draw", Select_Button_32x32);
variable_instance_set(import_mm0, "image_index", 0);
variable_instance_set(import_mm0, "display", "Import MM0");
variable_instance_set(import_mm0, "image", 0);