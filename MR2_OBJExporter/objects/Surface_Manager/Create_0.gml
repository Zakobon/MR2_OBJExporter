timer = 0;
tmd_view_scale = .3; //Initial Zoom Level
tim_count = 0;

t_mode = ["opaque", "semi-transparent"];
bit_string = ["_4Bit","_8Bit"];
grid_string = ["","G"];
	
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

//transparency_mode = [ 
// Opaque,
// Semi-Transparent_0 (Front(% 50) + Back(% 50)),
// Semi-Transparent_1 (Front(%100) + Back(%100)), //Dunno how to do the following in OBJ/MTL yet...
// Semi-Transparent_2 (Front(%100) - Back(%100)), 
// Semi-Transparent_3 (Front(%100) + Back(% 25))
//] 
globalvar transparency_mode; //unused currently
transparency_mode = [1, .75, 1, 1, .25];


//vram page surfaces(256, 256) for png export
globalvar vram28_4bit;
globalvar vram29_4bit;
globalvar vram30_4bit;
globalvar vram31_4bit;
vram28_4bit = [];
vram29_4bit = [];
vram30_4bit = [];
vram31_4bit = [];
globalvar vram28_8bit;
globalvar vram29_8bit;
globalvar vram30_8bit;
globalvar vram31_8bit;
vram28_8bit = [];
vram29_8bit = [];
vram30_8bit = [];
vram31_8bit = [];

//flags to identify what pages were found/drawn to
globalvar draw_check28_4bit;
globalvar draw_check29_4bit;
globalvar draw_check30_4bit;
globalvar draw_check31_4bit;
draw_check28_4bit = [];
draw_check29_4bit = [];
draw_check30_4bit = [];
draw_check31_4bit = [];
globalvar draw_check28_8bit;
globalvar draw_check29_8bit;
globalvar draw_check30_8bit;
globalvar draw_check31_8bit;
draw_check28_8bit = [];
draw_check29_8bit = [];
draw_check30_8bit = [];
draw_check31_8bit = [];
	
repeat (5){
	array_push(vram28_4bit, -1);
	array_push(vram29_4bit, -1);
	array_push(vram30_4bit, -1);
	array_push(vram31_4bit, -1);
	
	array_push(vram28_8bit, -1);
	array_push(vram29_8bit, -1);
	array_push(vram30_8bit, -1);
	array_push(vram31_8bit, -1);
	
	array_push(draw_check28_4bit, false);
	array_push(draw_check29_4bit, false);
	array_push(draw_check30_4bit, false);
	array_push(draw_check31_4bit, false);
	
	array_push(draw_check28_8bit, false);
	array_push(draw_check29_8bit, false);
	array_push(draw_check30_8bit, false);
	array_push(draw_check31_8bit, false);
}

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

globalvar grid_colors; //array of colors used for drawing grids
grid_colors = [];
#region Draw Primitive Preview Variables
globalvar PageModePrim; 
PageModePrim = {
	vram28 : 0,
	vram29 : 0,
	vram30 : 0,
	vram31 : 0
}
reverse = false;
vmax = 232;
vmin = 32;
step = 1.5;
timer_color = vmin;
#endregion
#region //build grid_colors[] size = 60

hue = 0;
sat = 255;
val = 255;
count = 0;
repeat (60) {
	if (count > 11){
		count = 0;
		val -= 48;
		if (val < 96){
			val = 255;
			sat *= .7;
			if (sat < 0){
				sat = 255;
			}
		}
	}
	
	switch(count){ //hue selection
		case 0:
		hue = 0;
		sat2 = sat;
		val2 = val;
		break;
		
		case 1:
		hue = 20;
		sat2 = sat;
		val2 = val;
		break;
		
		case 2:
		hue = 26;
		sat2 = sat;
		val2 = val;
		break;
		
		case 3:
		hue = 32;
		sat2 = sat;
		val2 = val;
		break;
		
		case 4:
		hue = 40;
		sat2 = sat;
		val2 = val;
		break;
		
		case 5:
		hue = 64;
		sat2 = sat;
		val2 = val;
		break;
		
		case 6:
		hue = 106;
		sat2 = sat - 64;
		val2 = val * .8;
		break;
		
		case 7:
		hue = 128;
		sat2 = sat;
		val2 = val;
		break;
		
		case 8:
		hue = 144;
		sat2 = sat;
		val2 = val;
		break;
		
		case 9:
		hue = 160;
		sat2 = sat;
		val2 = val;
		break;
		
		case 10:
		hue = 192;
		sat2 = sat;
		val2 = val;
		break;
		
		case 11:
		hue = 205;
		sat2 = sat;
		val2 = val;
		break;
		
		case 12:
		hue = 224;
		sat2 = sat;
		val2 = val;
		break;

	}

	array_push(grid_colors, make_colour_hsv(hue,sat2,val2));
	hue += 8;
	count++;
}
#endregion
#region //Not used//
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
#endregion
