draw_mouse_x = "--";
draw_mouse_y = "--";

if ((mouse_x >= Main_View.left && mouse_x < Main_View.left + 511) && (mouse_y >= Main_View.top && mouse_y < Main_View.top + 511)){
	draw_mouse_x = string(round((mouse_x - Main_View.left) / 2));
	draw_mouse_y = string(round((mouse_y - Main_View.top) / 2));
}
draw_text_transformed(Main_View.left + 0, Main_View.top - 16, "x:" + draw_mouse_x, .75, .75, 0);
draw_text_transformed(Main_View.left + 55, Main_View.top - 16, "y:" + draw_mouse_y, .75, .75, 0);