//draw_sprite_stretched(Button_16x16, 23, x, y, 200, 26);
if (draw_menu == true){
	x_bound = mouse_x >= x && mouse_x < x + menu.button[0].w;
	for (var a = 0; a < array_length(menu.button);a++){
		s_ind = 1;
		h_off = 19 * a;
		y_off = (h_off) + (a * 2) + 26;
		y_bound = mouse_y >= y + y_off && mouse_y < y + y_off + menu.button[a].h;
		if (y_bound == true && x_bound == true){
			s_ind = 0;
		}
		draw_sprite_stretched(Menu_Slot_8x8, s_ind, x, y + y_off, menu.button[a].w, menu.button[a].h);
		draw_text_transformed(x + 4, y + y_off + 4, string(menu.button[a].display), .6, .6, 0);
	}
}
draw_text(mouse_x + 20, mouse_y, string(button_lock));