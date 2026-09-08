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
	view28[0] = 0;
	view28[1] = 0;
}
else{
	view28[0] = grid_mode28[1] + 1;
	view28[1] = grid_mode28[2];
}

if (PageModeTIM.vram29 & 0b01 == 0){
	view29[0] = 0;
	view29[1] = 0;
}
else{
	view29[0] = grid_mode29[1] + 1;
	view29[1] = grid_mode29[2];
}

if (PageModeTIM.vram30 & 0b01 == 0){
	view30[0] = 0;
	view30[1] = 0;
}
else{
	view30[0] = grid_mode30[1] + 1;
	view30[1] = grid_mode30[2];
}

if (PageModeTIM.vram31 & 0b01 == 0){
	view31[0] = 0;
	view31[1] = 0;
}
else{
	view31[0] = grid_mode31[1] + 1;
	view31[1] = grid_mode31[2];
}
#endregion

if (ui_name_tex != "None"){
	filename = string_delete(ui_name_tex, string_length(ui_name_tex) - 3, 4);
}

#region Draw Page Preview
gpu_set_colourwriteenable(true, true, true, false);

if (draw_check28_8bit == true || draw_check28_4bit == true){
	draw_sprite(T_Grid, 0, p28_Window.left + 1, p28_Window.top + 1);
	draw_28 = string("Page 28: {0}_vram28{1}{2}.png", filename, bit_string[PageModeTIM.vram28 >> 1], grid_string[grid_mode28[0]])
	switch (PageModeTIM.vram28 >> 1){
		case 0:
		if (sprite_exists(grid_sprites[view28[0]][view28[1]])){//grid_sprites[page][pattern][variant]
			//draw_sprite(grid_sprites[0][view28[0]][view28[1]], 0, p28_Window.left + 1, p28_Window.top + 1);
			draw_sprite_part(grid_sprites[view28[0]][view28[1]], 0, 0 * 256, 0, 256, 256, p28_Window.left + 1, p28_Window.top + 1);
		}
		break;
		case 1:
		if (sprite_exists(grid_sprites[view28[0]][view28[1]])){
			//draw_sprite(grid_sprites[4][view28[0]][view28[1]], 0, p28_Window.left + 1, p28_Window.top + 1);
			draw_sprite_part(grid_sprites[view28[0]][view28[1]], 0, 4 * 256, 0, 256, 256, p28_Window.left + 1, p28_Window.top + 1);
		}
		break;
	}
}
else{
	draw_28 = string("Page 28: None")
}

if (draw_check29_8bit == true || draw_check29_4bit == true ){
	draw_sprite(T_Grid, 0, p29_Window.left + 1, p29_Window.top + 1);
	draw_29 = string("Page 29: {0}_vram29{1}{2}.png", filename, bit_string[PageModeTIM.vram29 >> 1], grid_string[grid_mode29[0]])
	switch (PageModeTIM.vram29 >> 1){
		case 0:
		if (sprite_exists(grid_sprites[view29[0]][view29[1]])){
			//draw_sprite(grid_sprites[1][view29[0]][view29[1]], 0, p29_Window.left + 1, p29_Window.top + 1);
			draw_sprite_part(grid_sprites[view29[0]][view29[1]], 0, 1 * 256, 0, 256, 256, p29_Window.left + 1, p29_Window.top + 1);
		}
		break;
		case 1:
		if (sprite_exists(grid_sprites[view29[0]][view29[1]])){
			//draw_sprite(grid_sprites[5][view29[0]][view29[1]], 0, p29_Window.left + 1, p29_Window.top + 1);
			draw_sprite_part(grid_sprites[view29[0]][view29[1]], 0, 5 * 256, 0, 256, 256, p29_Window.left + 1, p29_Window.top + 1);
		}
		break;
	}
}
else{
	draw_29 = string("Page 29: None")
}

if (draw_check30_8bit == true || draw_check30_4bit == true ){
	draw_sprite(T_Grid, 0, p30_Window.left + 1, p30_Window.top + 1);
	draw_30 = string("Page 30: {0}_vram30{1}{2}.png", filename, bit_string[PageModeTIM.vram30 >> 1], grid_string[grid_mode30[0]])
	switch (PageModeTIM.vram30 >> 1){
		case 0:
		if (sprite_exists(grid_sprites[view30[0]][view30[1]])){
			//draw_sprite(grid_sprites[2][view30[0]][view30[1]], 0, p30_Window.left + 1, p30_Window.top + 1);
			draw_sprite_part(grid_sprites[view30[0]][view30[1]], 0, 2 * 256, 0, 256, 256, p30_Window.left + 1, p30_Window.top + 1);
		}
		break;
		case 1:
		if (sprite_exists(grid_sprites[view30[0]][view30[1]])){
			//draw_sprite(grid_sprites[6][view30[0]][view30[1]], 0, p30_Window.left + 1, p30_Window.top + 1);
			draw_sprite_part(grid_sprites[view30[0]][view30[1]], 0, 6 * 256, 0, 256, 256, p30_Window.left + 1, p30_Window.top + 1);
		}
		break;
	}
}
else{
	draw_30 = string("Page 30: None")
}

if (draw_check31_8bit == true || draw_check31_4bit == true ){
	draw_sprite(T_Grid, 0, p31_Window.left + 1, p31_Window.top + 1);
	draw_31 = string("Page 31: {0}_vram31{1}{2}.png", filename, bit_string[PageModeTIM.vram31 >> 1], grid_string[grid_mode31[0]])
	switch (PageModeTIM.vram31 >> 1){
		case 0:
		if (sprite_exists(grid_sprites[view31[0]][view31[1]])){
			//draw_sprite(grid_sprites[3][view31[0]][view31[1]], 0, p31_Window.left + 1, p31_Window.top + 1);
			draw_sprite_part(grid_sprites[view31[0]][view31[1]], 0, 3 * 256, 0, 256, 256, p31_Window.left + 1, p31_Window.top + 1);
		}
		break;
		case 1:
		if (sprite_exists(grid_sprites[view31[0]][view31[1]])){
			//draw_sprite(grid_sprites[7][view31[0]][view31[1]], 0, p31_Window.left + 1, p31_Window.top + 1);
			draw_sprite_part(grid_sprites[view31[0]][view31[1]], 0, 7 * 256, 0, 256, 256, p31_Window.left + 1, p31_Window.top + 1);
		}
		break;
	}
}
else{
	draw_31 = string("Page 31: None")
}
gpu_set_colourwriteenable(true, true, true, true);
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