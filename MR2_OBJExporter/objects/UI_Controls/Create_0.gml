globalvar test1; // Unset
test1 = ["null","null"];

globalvar test2; // GetModel create line: 200
test2 = ["null","null"];

globalvar test3; // GetModel user event 0 line: 62
test3 = ["null","null"];

globalvar test4; // GetModel user event 0 line: 63
test4 = ["null","null"];

globalvar edit_mode; //For swapping between edit menus in the UI
edit_mode = 0; //0:TIM 1:TMD

globalvar IO;
IO = layer_get_flexpanel_node("File_Menu");

globalvar button_lock;
button_lock = 0;

globalvar TEX_fname;
tex_window = flexpanel_node_get_child(IO, "TEX_fname");
TEX_fname = flexpanel_node_layout_get_position(tex_window, 0);

globalvar MM0_fname;
mm0_window = flexpanel_node_get_child(IO, "MM0_fname");
MM0_fname = flexpanel_node_layout_get_position(mm0_window, 0);

globalvar in_TIM;
in_window = flexpanel_node_get_child(IO, "in_TIM");
in_TIM = flexpanel_node_layout_get_position(in_window, 0);

globalvar out_TIM;
out_window = flexpanel_node_get_child(IO, "out_PNG");
out_TIM = flexpanel_node_layout_get_position(out_window, 0);

globalvar in_MM0;
in_window = flexpanel_node_get_child(IO, "in_MM0");
in_MM0 = flexpanel_node_layout_get_position(in_window, 0);

globalvar out_MM0;
out_window = flexpanel_node_get_child(IO, "out_OBJ");
out_MM0 = flexpanel_node_layout_get_position(out_window, 0);

globalvar Instr_Window;
window = flexpanel_node_get_child(IO, "Instructions");
Instr_Window = flexpanel_node_layout_get_position(window, 0);