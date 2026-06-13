//if (surface_exists(draw_ui_tmd)){
//	//draw_surface(draw_ui_tmd, 1048 - (surface_get_height(draw_ui_tmd) / 2), 300 - surface_get_width(draw_ui_tmd));
//	draw_surface(draw_ui_tmd, tmd_window.left + 4, tmd_window.top + 4);
	
//}
//if (surface_exists(draw_ui_grid)){
//	draw_surface(draw_ui_grid, grid_x, grid_y);
//}

switch (view_semitransparency){
	case false:
	view = 2;
	break;
	
	case true:
	view = 3;
	break;
}



if (ui_name_tex != "None"){
	filename = string_delete(ui_name_tex, string_length(ui_name_tex) - 3, 4);
}


if (draw_check28[0] == true){
	draw_28 = string("VRAM Page 28: {0}_vram28.png", filename)
	if (surface_exists(vram28[view])){
		draw_surface(vram28[view], p28_Window.left + 1, p28_Window.top + 1)
	}
}
else{
	draw_28 = string("VRAM Page 28: None")
}

if (draw_check29[0] == true){
	draw_29 = string("VRAM Page 29: {0}_vram29.png", filename)
	if (surface_exists(vram29[view])){
		draw_surface(vram29[view], p29_Window.left + 1, p29_Window.top + 1)
	}
}
else{
	draw_29 = string("VRAM Page 29: None")
}

if (draw_check30[0] == true){
	draw_30 = string("VRAM Page 30: {0}_vram30.png", filename)
	if (surface_exists(vram30[view])){
		draw_surface(vram30[view], p30_Window.left + 1, p30_Window.top + 1)
	}
}
else{
	draw_30 = string("VRAM Page 30: None")
}

if (draw_check31[0] == true){
	draw_31 = string("VRAM Page 31: {0}_vram31.png", filename)
	if (surface_exists(vram31[view])){
		draw_surface(vram31[view], p31_Window.left + 1, p31_Window.top + 1)
	}
}
else{
	draw_31 = string("VRAM Page 31: None")
}
draw_set_colour($FFFFFF);
draw_text_transformed(p28_Window.left + 4, p28_Window.top - 12, draw_28, .5, .5, 0);
draw_text_transformed(p29_Window.left + 4, p29_Window.top - 12, draw_29, .5, .5, 0);
draw_text_transformed(p30_Window.left + 4, p30_Window.top - 12, draw_30, .5, .5, 0);
draw_text_transformed(p31_Window.left + 4, p31_Window.top - 12, draw_31, .5, .5, 0);