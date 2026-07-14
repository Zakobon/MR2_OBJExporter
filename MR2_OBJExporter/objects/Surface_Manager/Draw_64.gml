//if (surface_exists(draw_ui_tmd)){
//	//draw_surface(draw_ui_tmd, 1048 - (surface_get_height(draw_ui_tmd) / 2), 300 - surface_get_width(draw_ui_tmd));
//	draw_surface(draw_ui_tmd, tmd_window.left + 4, tmd_window.top + 4);
	
//}
//if (surface_exists(draw_ui_grid)){
//	draw_surface(draw_ui_grid, grid_x, grid_y);
//}
//#region Retrieve VRAM Page Modes

//var page28_mode = variable_instance_get(Visibility_UI, "PageModeTIM.vram28");
//var page29_mode = variable_instance_get(Visibility_UI, "PageModeTIM.vram29");
//var page30_mode = variable_instance_get(Visibility_UI, "PageModeTIM.vram30");
//var page31_mode = variable_instance_get(Visibility_UI, "PageModeTIM.vram31");
//#endregion
#region Set View Mode based on PageModeTIM.vram28-31
if (PageModeTIM.vram28 & 0b01 == 0){
	switch (view_semitransparency){
		case false:
		view28 = 2;
		break;
	
		case true:
		view28 = 3;
		break;
	}
}
else{
	view28 = 4;
}

if (PageModeTIM.vram29 & 0b01 == 0){
	switch (view_semitransparency){
		case false:
		view29 = 2;
		break;
	
		case true:
		view29 = 3;
		break;
	}
}
else{
	view29 = 4;
}

if (PageModeTIM.vram30 & 0b01 == 0){
	switch (view_semitransparency){
		case false:
		view30 = 2;
		break;
	
		case true:
		view30 = 3;
		break;
	}
}
else{
	view30 = 4;
}

if (PageModeTIM.vram31 & 0b01 == 0){
	switch (view_semitransparency){
		case false:
		view31 = 2;
		break;
	
		case true:
		view31 = 3;
		break;
	}
}
else{
	view31 = 4;
}
#endregion

if (ui_name_tex != "None"){
	filename = string_delete(ui_name_tex, string_length(ui_name_tex) - 3, 4);
}

#region Draw Page Preview
#region Variable Instance Get: Visibility_UI 
check28 = variable_instance_get(Visibility_UI, "check28_4bit") | variable_instance_get(Visibility_UI, "check28_8bit");
check29 = variable_instance_get(Visibility_UI, "check29_4bit") | variable_instance_get(Visibility_UI, "check29_8bit");
check30 = variable_instance_get(Visibility_UI, "check30_4bit") | variable_instance_get(Visibility_UI, "check30_8bit");
check31 = variable_instance_get(Visibility_UI, "check31_4bit") | variable_instance_get(Visibility_UI, "check31_8bit");
#endregion

if (check28 == true){
	draw_sprite(T_Grid, 0, p28_Window.left + 1, p28_Window.top + 1);
}
if (check29 == true){
	draw_sprite(T_Grid, 0, p29_Window.left + 1, p29_Window.top + 1);
}
if (check30 == true){
	draw_sprite(T_Grid, 0, p30_Window.left + 1, p30_Window.top + 1);
}
if (check31 == true){
	draw_sprite(T_Grid, 0, p31_Window.left + 1, p31_Window.top + 1);
}
if (draw_check28_8bit[0] == true || draw_check28_4bit[0] == true ){
	draw_28 = string("VRAM Page 28: {0}_vram28{1}{2}.png", filename, bit_string[PageModeTIM.vram28 >> 1], grid_string[grid_mode])
	switch (PageModeTIM.vram28 >> 1){
		case 0:
		if (surface_exists(vram28_4bit[view28])){
			draw_surface(vram28_4bit[view28], p28_Window.left + 1, p28_Window.top + 1)
		}
		break;
		
		case 1:
		if (surface_exists(vram28_8bit[view28])){
			draw_surface(vram28_8bit[view28], p28_Window.left + 1, p28_Window.top + 1)
		}
		break;
	}
}
else{
	draw_28 = string("VRAM Page 28: None")
}

if (draw_check29_8bit[0] == true || draw_check29_4bit[0] == true ){
	draw_29 = string("VRAM Page 29: {0}_vram29{1}{2}.png", filename, bit_string[PageModeTIM.vram29 >> 1], grid_string[grid_mode])
	switch (PageModeTIM.vram29 >> 1){
		case 0:
		if (surface_exists(vram29_4bit[view29])){
			draw_surface(vram29_4bit[view29], p29_Window.left + 1, p29_Window.top + 1)
		}
		break;
		
		case 1:
		if (surface_exists(vram29_8bit[view29])){
			draw_surface(vram29_8bit[view29], p29_Window.left + 1, p29_Window.top + 1)
		}
		break;
	}
}
else{
	draw_29 = string("VRAM Page 29: None")
}

if (draw_check30_8bit[0] == true || draw_check30_4bit[0] == true ){
	draw_30 = string("VRAM Page 30: {0}_vram30{1}{2}.png", filename, bit_string[PageModeTIM.vram30 >> 1], grid_string[grid_mode])
	switch (PageModeTIM.vram30 >> 1){
		case 0:
		if (surface_exists(vram30_4bit[view30])){
			draw_surface(vram30_4bit[view30], p30_Window.left + 1, p30_Window.top + 1)
		}
		break;
		
		case 1:
		if (surface_exists(vram30_8bit[view30])){
			draw_surface(vram30_8bit[view30], p30_Window.left + 1, p30_Window.top + 1)
		}
		break;
	}
}
else{
	draw_30 = string("VRAM Page 30: None")
}

if (draw_check31_8bit[0] == true || draw_check31_4bit[0] == true ){
	draw_31 = string("VRAM Page 31: {0}_vram31{1}{2}.png", filename, bit_string[PageModeTIM.vram31 >> 1], grid_string[grid_mode])
	switch (PageModeTIM.vram31 >> 1){
		case 0:
		if (surface_exists(vram31_4bit[view31])){
			draw_surface(vram31_4bit[view31], p31_Window.left + 1, p31_Window.top + 1)
		}
		break;
		
		case 1:
		if (surface_exists(vram31_8bit[view31])){
			draw_surface(vram31_8bit[view31], p31_Window.left + 1, p31_Window.top + 1)
		}
		break;
	}
}
else{
	draw_31 = string("VRAM Page 31: None")
}
#endregion

#region Draw Primitive Preview
switch (reverse){
	case true:
	timer_color -= step;
	if (timer_color < vmin){
		timer_color = vmin;
		reverse = false;
	}
	break;
	case false:
	timer_color += step;
	if (timer_color > vmax){
		timer_color = vmax;
		reverse = true;
	}
	break;
}
line_color = make_colour_hsv(0, 0, timer_color);
fill_color = make_colour_hsv(0, 0, (timer_color * .25));
if (instance_exists(GetModel)){
	tmd_prim_draw(tmd_edit.prim, 0, array_length(tmd_edit.prim), line_color, fill_color);
}
#endregion

draw_set_colour($FFFFFF);
draw_text_transformed(p28_Window.left + 4, p28_Window.top - 12, draw_28, .5, .5, 0);
draw_text_transformed(p29_Window.left + 4, p29_Window.top - 12, draw_29, .5, .5, 0);
draw_text_transformed(p30_Window.left + 4, p30_Window.top - 12, draw_30, .5, .5, 0);
draw_text_transformed(p31_Window.left + 4, p31_Window.top - 12, draw_31, .5, .5, 0);