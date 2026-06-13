timer = 0;
tmd_view_scale = .3; //Initial Zoom Level


globalvar tmd_draw;
tmd_draw = -1;

globalvar draw_refresh; 
draw_refresh = 0;

globalvar draw_vram; //draw surface for all 32 VRAM pages
draw_vram = -1;

globalvar draw_ui_tmd; //draw surface for the model
draw_ui_tmd = -1;

globalvar draw_tmd_view; //side of drawn model
draw_tmd_view = 0

globalvar UI;
UI = layer_get_flexpanel_node("UI");



//Visibilty ui settings
globalvar view_semitransparency; //true = alpha applied
view_semitransparency = false;
globalvar view_transparency; //true = Checkered, false = Black
view_transparency = true;
globalvar vramback; //Background layer so that transparency is recognizable (checkered pattern)
vramback = -1;

//vram page surfaces(256, 256) for png export
globalvar vram28; 
vram28 = [-1, -1, -1, -1];
globalvar vram29;
vram29 = [-1, -1, -1, -1];
globalvar vram30;
vram30 = [-1, -1, -1, -1];
globalvar vram31;
vram31 = [-1, -1, -1, -1];


//transparency_mode = [ 
// Opaque,
// Semi-Transparent_0 (Front(% 50) + Back(% 50)),
// Semi-Transparent_1 (Front(%100) + Back(%100)), //Dunno how to do the following in OBJ/MTL yet...
// Semi-Transparent_2 (Front(%100) - Back(%100)), 
// Semi-Transparent_3 (Front(%100) + Back(% 25))
//] 
globalvar transparency_mode; //unused currently
transparency_mode = [1, .75, 1, 1, .25];

globalvar draw_check28; //for identifying what vram pages have been drawn to
draw_check28 = [false, false, false, false, false]; 
globalvar draw_check29;
draw_check29 = [false, false, false, false, false];
globalvar draw_check30;
draw_check30 = [false, false, false, false, false];
globalvar draw_check31;
draw_check31 = [false, false, false, false, false];

globalvar Main_View; //Main drawing area. Large square(512x512) in center of window
window = flexpanel_node_get_child(UI, "Main_View");
Main_View = flexpanel_node_layout_get_position(window);

globalvar Sub_View; //Secondary drawing area. Small square(256x256) in top-right of window
tmd_window = flexpanel_node_get_child(UI, "Sub_View");
tmd_window = flexpanel_node_get_child(UI, "Window");
Sub_View = flexpanel_node_layout_get_position(tmd_window, 0);

draw_28 = "";
draw_29 = "";
draw_30 = "";
draw_31 = "";

globalvar p28_Window;
window = flexpanel_node_get_child(UI, "p28");
p28_Window = flexpanel_node_layout_get_position(window, 0);

globalvar p29_Window;
window = flexpanel_node_get_child(UI, "p29");
p29_Window = flexpanel_node_layout_get_position(window, 0);

globalvar p30_Window;
window = flexpanel_node_get_child(UI, "p30");
p30_Window = flexpanel_node_layout_get_position(window, 0);

globalvar p31_Window;
window = flexpanel_node_get_child(UI, "p31");
p31_Window = flexpanel_node_layout_get_position(window, 0);

uv_window = Main_View;
tmd_window = Sub_View;


//draw order
globalvar tmd_draw_x; //prims sorted by x_depth
tmd_draw_x = [];
globalvar tmd_draw_z; //prims sorted by z_depth
tmd_draw_z = [];
globalvar tmd_draw_x2; //prims sorted by -x_depth
tmd_draw_x = [];
globalvar tmd_draw_z2; //prims sorted by -z_depth

tmd_draw_z = [];


globalvar test_value_1;
test_value_1 = 0;

globalvar test_value_2;
test_value_2 = 0;

//Grid window to draw vram surface and polygons to
globalvar draw_ui_grid;
draw_ui_grid = -1;

//Not used//
x_sort = function sortx(a,b) {
	if (a.ax > b.ax){
		return -1;
	}
	else if (a.ax <= b.ax){
		return 1;
	}
	else{
		return 0;
	}
}
z_sort = function sortz(a,b) {
	if (a.az > b.az){
		return -1;
	}
	else if (a.az <= b.az){
		return 1;
	}
	else{
		return 0;
	}
}
x2_sort = function sortx2(a,b) {
	if (a.ax > b.ax){
		return 1;
	}
	else if (a.ax <= b.ax){
		return -1;
	}
	else{
		return 0;
	}
}
z2_sort = function sortz2(a,b) {
	if (a.az > b.az){
		return 1;
	}
	else if (a.az <= b.az){
		return -1;
	}
	else{
		return 0;
	}
}