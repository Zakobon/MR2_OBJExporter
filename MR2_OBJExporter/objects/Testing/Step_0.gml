switch (keyboard_lastkey){
	case vk_left:
	tim_select--;
	if (tim_select < 0){
		tim_select = ds_list_size(tim_list) - 1;
	}
	keyboard_lastkey = -1
	break;
	
	case vk_right:
	tim_select++;
	if (tim_select > ds_list_size(tim_list) - 1){
		tim_select = 0;
	}
	keyboard_lastkey = -1
	break;
}