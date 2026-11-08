apply = 0;
image_index = 0;
timer = 0;
surf = -1;

window = flexpanel_node_get_child(IO, "Export_Mode");
export_mode_window = flexpanel_node_layout_get_position(window, 0);

globalvar filename_array;
filename_array = [];

globalvar obj_duplicate; //tracks the number of duplicate exports to display, so you know it's still doing something
obj_duplicate = 0;

globalvar timb_tmd; //modified copy of tmd_edit
timb_tmd = -1;

globalvar timb_sprite; //sprite for export, formated the same way as TIMBuilder's PNGs
timb_sprite = -1;

globalvar timb_groups; //holds arrays of prim indecies sorted by TIM coord bounds
timb_groups = []; //timb_groups[TIM #][prim indices] | example: timb_groups[3][10, 165, 166...]

globalvar tmd_reverse;
tmd_reverse = -1;

globalvar adv_options;
adv_options = {
	//Export settings
	filepath : "",
	user_path_flag : false,
	normals : false, //In-game Normals
	quad_split : true, //Break-up 4-sided Polygons into 3-sided
	timbuilder : true //Export OBJ in the TIMBuilder format instead of VRAM Pages
}

//export_status = ["Edit Target", "File not found", "File Found", "Exported"];
export_status = ["File not found", "File Found", "Exported!"];
last_mode = adv_options.timbuilder;

export_mm0 = instance_create_layer(out_OBJ.left, out_OBJ.top, "UI_Draw", Select_Button_32x32);
variable_instance_set(export_mm0, "image_index", 0);
variable_instance_set(export_mm0, "display", "Export OBJ");
variable_instance_set(export_mm0, "image", 0);
variable_instance_set(export_mm0, "enable", 0);

export_mode = instance_create_layer(export_mode_window.left, export_mode_window.top, "UI_Draw", Drop_Down_Menu_24x24);
variable_instance_set(export_mode, "display", "Export Mode");
variable_instance_set(export_mode, "button_array", ["VRAM Pages", "TIMBuilder"]);
variable_instance_set(export_mode, "selection", adv_options.timbuilder);
variable_instance_set(export_mode, "selection_display", true);


//A_MM0 = instance_create_layer(out_OBJ.left + 0, out_OBJ.top + 36, "UI_Draw", Select_Button_24x24);
//variable_instance_set(A_MM0, "image_index", 4);
//variable_instance_set(A_MM0, "image_xscale", 1.7);
//variable_instance_set(A_MM0, "image", 4);
//variable_instance_set(A_MM0, "display", "a");
//variable_instance_set(A_MM0, "enable", 0);
//variable_instance_set(A_MM0, "toggle_set", 1);

//B_MM0 = instance_create_layer(out_OBJ.left + 0, out_OBJ.top + 64, "UI_Draw", Select_Button_24x24);
//variable_instance_set(B_MM0, "image_index", 4);
//variable_instance_set(B_MM0, "image_xscale", 1.7);
//variable_instance_set(B_MM0, "image", 4);
//variable_instance_set(B_MM0, "display", "b");
//variable_instance_set(B_MM0, "enable", 0);
//variable_instance_set(B_MM0, "toggle_set", 1);

//D_MM0 = instance_create_layer(out_OBJ.left + 0, out_OBJ.top + 92, "TIM_Draw", Select_Button_24x24);
//variable_instance_set(D_MM0, "image_index", 4);
//variable_instance_set(D_MM0, "image_xscale", 1.7);
//variable_instance_set(D_MM0, "image", 4);
//variable_instance_set(D_MM0, "display", "d");
//variable_instance_set(D_MM0, "enable", 0);
//variable_instance_set(D_MM0, "toggle_set", 1);

//I_MM0 = instance_create_layer(out_OBJ.left + 64, out_OBJ.top + 36, "UI_Draw", Select_Button_24x24);
//variable_instance_set(I_MM0, "image_index", 4);
//variable_instance_set(I_MM0, "image_xscale", 1.7);
//variable_instance_set(I_MM0, "image", 4);
//variable_instance_set(I_MM0, "display", "i");
//variable_instance_set(I_MM0, "enable", 0);
//variable_instance_set(I_MM0, "toggle_set", 1);

//P_MM0 = instance_create_layer(out_OBJ.left + 64, out_OBJ.top + 64, "UI_Draw", Select_Button_24x24);
//variable_instance_set(P_MM0, "image_index", 4);
//variable_instance_set(P_MM0, "image_xscale", 1.7);
//variable_instance_set(P_MM0, "image", 4);
//variable_instance_set(P_MM0, "display", "p");
//variable_instance_set(P_MM0, "enable", 0);
//variable_instance_set(P_MM0, "toggle_set", 1);
//variable_instance_set(P_MM0, "y_off", -2);


//V_MM0 = instance_create_layer(out_OBJ.left + 64, out_OBJ.top + 92, "UI_Draw", Select_Button_24x24);
//variable_instance_set(V_MM0, "image_index", 4);
//variable_instance_set(V_MM0, "image_xscale", 1.7);
//variable_instance_set(V_MM0, "image", 4);
//variable_instance_set(V_MM0, "display", "v");
//variable_instance_set(V_MM0, "enable", 0);
//variable_instance_set(V_MM0, "toggle_set", 1);

//filename_found[0] = 0;
//filename_found[1] = 0;
//filename_found[2] = 0;
//filename_found[3] = 0;
//filename_found[4] = 0;
//filename_found[5] = 0;
