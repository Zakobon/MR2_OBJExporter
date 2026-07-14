if (button_lock == 1){
	exit;
}
if (enable == 0){
	image_index = image + 1;
	exit;
}
if (position_meeting(mouse_x, mouse_y, id)){
	if ((mouse_check_button(mb_left)) && (hold != 1)){
		image_index = image + 1;
		active = !active;
		if (toggle_set == 1){
			toggle = !toggle;
		}
		hold = 1;
	}
}
if (mouse_check_button_released(mb_left)){
	if (hold == 1){
		hold = 0;
		image_index = image;
	}
}