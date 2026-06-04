globalvar filepath;
filepath = "";
globalvar user_filepath; //folder user selects to output to
user_filepath = "(waiting for import)";
globalvar user_filepath_given;
user_filepath_given = false;

globalvar File_Window;
File_Window = layer_get_flexpanel_node("File_Menu");

globalvar Path_Window;
exportpath = flexpanel_node_get_child(File_Window, "Export_Path");
Path_Window = flexpanel_node_layout_get_position(exportpath, 0);

changepath = instance_create_layer(Path_Window.left + 6, Path_Window.top - 2, "UI_Draw", Select_Button_24x24);
variable_instance_set(changepath, "image_index", 0);
variable_instance_set(changepath, "display", "Choose Export Directory");
variable_instance_set(changepath, "image", 0);