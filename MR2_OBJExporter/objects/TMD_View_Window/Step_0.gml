var x_p_active = variable_instance_get(x_p, "active")
var x_m_active = variable_instance_get(x_m, "active")
//var y_p_active = variable_instance_get(y_p, "active")
//var y_m_active = variable_instance_get(y_m, "active")

if (x_p_active == 1){
	draw_tmd_view++;
	if (draw_tmd_view > 3){
		draw_tmd_view = 0;
	}
	draw_refresh = draw_refresh | 0b1;
	variable_instance_set(x_p, "active", 0);
}
if (x_m_active == 1){
	draw_tmd_view--;
	if (draw_tmd_view < 0){
		draw_tmd_view = 3;
	}
	draw_refresh = draw_refresh | 0b1;
	variable_instance_set(x_m, "active", 0);
}

if (hold == 1 || ((mouse_x > window.left && mouse_x < window.left + window.width) && (mouse_y > window.top && mouse_y < window.top + window.height))){
	if (mouse_wheel_up()){
		draw_tmd_zoom = draw_tmd_zoom * 1.1
		draw_tmd_pan_x *= 1.1;
		draw_tmd_pan_y *= 1.1;
		draw_refresh = draw_refresh | 0b1;
	}
	if (mouse_wheel_down()){
		draw_tmd_zoom = draw_tmd_zoom * .9;
		draw_tmd_pan_x *= .9;
		draw_tmd_pan_y *= .9;
		draw_refresh = draw_refresh | 0b1;
	}
	if (mouse_check_button(mb_left)){
		button_lock = 1;
		if (hold == 0){
			pan_x_start = mouse_x;
			pan_y_start = mouse_y;
			last_pan_x = draw_tmd_pan_x;
			last_pan_y = draw_tmd_pan_y;
		}
		hold = 1;
		
		draw_refresh = draw_refresh | 0b1;
		if (timer % 2){
			
			draw_tmd_pan_x = mouse_x - pan_x_start + last_pan_x;
			draw_tmd_pan_y = mouse_y - pan_y_start + last_pan_y;
			draw_refresh = draw_refresh | 0b1;
		}
	}
	else{
		hold = 0;
		//draw_tmd_pan_x += last_pan_x;
		//draw_tmd_pan_y += last_pan_y;
		pan_x_start = 0;
		pan_y_start = 0;
		last_pan_x = 0;
		last_pan_y = 0;
	}
}
timer++;