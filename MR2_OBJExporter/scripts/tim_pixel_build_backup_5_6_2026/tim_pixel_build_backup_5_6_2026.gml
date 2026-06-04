function tim_pixel_build_backup_5_6_2026(_tim){
	new_tim = _tim;
	//need to add a switch and add 4-bit
	for (var b = 0; b < new_tim.pixel_h; b++){ 
		for (var c = 0; c < new_tim.pixel_w; c++){
			p_index = c + (b * new_tim.pixel_w);
			if (b == 0){
				new_tim.pixel_data[p_index][0] = 0xff;
				new_tim.pixel_data[p_index][1] = 0xff;
			}
			else if(b == new_tim.pixel_h -1 && c == 0){
				new_tim.pixel_data[p_index][0] = 0xff;
				new_tim.pixel_data[p_index][1] = 0xff;
			}
			else if(c == 0){
				new_tim.pixel_data[p_index][0] = 0xff;
				new_tim.pixel_data[p_index][1] = 0x11;
			}
			else if(b == new_tim.pixel_h - 1){
				new_tim.pixel_data[p_index][0] = 0xff;
				new_tim.pixel_data[p_index][1] = 0xff;
			}
			else if(c == new_tim.pixel_w -1){
				new_tim.pixel_data[p_index][0] = 0x11;
				new_tim.pixel_data[p_index][1] = 0xff;
			}
			else{
				new_tim.pixel_data[p_index][0] = 0x11;
				new_tim.pixel_data[p_index][1] = 0x11;
			}
		}
	}	
	_tim = new_tim;
}