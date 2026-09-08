var export_menu_active = variable_instance_get(export_menu, "active");

if (menu.draw == true){
	if (mouse_check_button_pressed(mb_left) == true){
		x_bound = mouse_x >= x && mouse_x < x + menu.button[0].w;
		for (var a = 0; a < array_length(menu.button);a++){
			h_off = 19 * a;
			y_off = (h_off) + (a * 2) + 26;
			y_bound = mouse_y >= y + y_off && mouse_y < y + y_off + menu.button[a].h;
			if (y_bound == true && x_bound == true){
				show_debug_message(string("{0}: active", menu.button[a].display))
			}
		}
		menu.draw = false;
		alarm[1] = 5;
	}
}

if (export_menu_active == 1){
	variable_instance_set(export_menu, "active", 0);
	button_lock = true;
	mouse_clear(mb_left);
	toggle = true;
	if (menu.draw == true){
		menu.draw = false;
		button_lock = false;
		exit;
	}
	if (alarm[2] == -1){
		menu.draw = true;
		alarm[2] = 1;
	}
	else{
		menu.draw = false;
		alarm[2] = 1;
	}
	
}
