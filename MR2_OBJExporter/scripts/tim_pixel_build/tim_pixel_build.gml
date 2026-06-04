function tim_pixel_build(_tim){
	new_tim = _tim;
	bitmode = new_tim.bit;
	mult = 1;
	switch (bitmode){
		case 0:
		mult = 4;
		new_tim.pixel_w = new_tim.pixel_w / 2;
		break;
		case 1:
		mult = 2;
		new_tim.pixel_w = new_tim.pixel_w * 2;
		break;
	}
	new_tim.pixel_data = [];
	//for (var b = 0; b < new_tim.pixel_h; b++){ 
	//	for (var c = 0; c < new_tim.pixel_w * mult; c++){
	for (var b = 0; b < new_tim.pixel_h; b++){ 
		for (var c = 0; c < new_tim.pixel_w * mult; c++){
			
			if (b == 0){
				switch (bitmode){
					case 0:
					array_push(new_tim.pixel_data, 0xf);
					break;
					
					case 1:
					array_push(new_tim.pixel_data, 0xff);
					break;
				}
			}
			else if(b == new_tim.pixel_h - 1 && c == 0){
				switch (bitmode){
					case 0:
					array_push(new_tim.pixel_data, 0xf);
					break;
					
					case 1:
					array_push(new_tim.pixel_data, 0xff);
					break;
				}
			}
			else if(c == 0){
				switch (bitmode){
					case 0:
					array_push(new_tim.pixel_data, 0xf);
					break;
					
					case 1:
					array_push(new_tim.pixel_data, 0xff);
					break;
				}
			}
			else if(b == new_tim.pixel_h - 1){
				switch (bitmode){
					case 0:
					array_push(new_tim.pixel_data, 0xf);
					break;
					
					case 1:
					array_push(new_tim.pixel_data, 0xff);
					break;
				}
			}
			else if(c == (new_tim.pixel_w * mult) - 1){
				switch (bitmode){
					case 0:
					array_push(new_tim.pixel_data, 0xf);
					break;
					
					case 1:
					array_push(new_tim.pixel_data, 0xff);
					break;
				}
			}
			else{
				switch (bitmode){
					case 0:
					array_push(new_tim.pixel_data, 0x1);
					break;
					
					case 1:
					array_push(new_tim.pixel_data, 0x01);
					break;
				}
			}
		}	
	}	
	_tim = new_tim;
}