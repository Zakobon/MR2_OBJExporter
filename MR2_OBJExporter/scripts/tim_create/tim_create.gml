function tim_create(_bit = 1, _pixelx = 832, _pixely = 256, _pixelw = 32, _pixelh = 64, _overwrite = 0){
	
	tim = {
		filename : "[Null]", //for importing/exporting TIMs, not TEX
		imported : 0,
		file_id : 0x10,
		version : 0x00, //always 0x00
		bit_flag : _bit & (1 << 3), //(bit0-2=Type; bit3=HasCLUT bit4-31=Reserved/zero)
		
		bit : _bit,   //0bx0111 0=4bpp, 1=8bpp, 2=16bpp, 3=24bpp, 4=Mixed.
		bit_old : _bit, //tracks original bit mode
		has_clut : 1, //0b1xxx
		t_edit : -1,
		
		clut_size : 0,
		clut_x : 0,
		clut_y : 505, //temp y coord
		clut_w : 256,
		clut_h : 1,
		clut_data : [],

		

		pixel_size : 0,
		pixel_x : _pixelx,
		pixel_y : _pixely,
		pixel_w : _pixelw,
		pixel_h : _pixelh,
		pixel_data : [],

	}
	//clut x, y is 0, 505-511 for Monster Rancher 2's monster textures
	//clut w, h is 256, 1
	//clut colors are buffer_u16
	
	new_tim = tim;
	
	
	//for (var a = 0; a < 256; a++){
	//	var b = a * 4;
	//	clut_data = {
	//		red : b & 0b11111,
	//		green : b & (0b11111 << 5),
	//		blue : b & (0b11111 << 10),
	//		stp : 0
	//	}
	//	array_push(new_tim.clut_data, clut_data);
	//}
	new_tim.clut_data = [];
	for (var a = 0; a < 256; a++){
		array_push(new_tim.clut_data, tim_data_clut[new_tim.clut_y - 505][a]);
	}
	if (_overwrite != 0){
		new_tim.pixel_x = _pixelx;
	}
	else{
		new_tim.pixel_x = (ui_page - 16) * 64;
	}

	for (var b = 0; b < new_tim.pixel_h; b++){ 
		for (var c = 0; c < new_tim.pixel_w * 2; c++){
			
			if (b == 0){
				array_push(new_tim.pixel_data, 0xff);
			}
			else if(b == new_tim.pixel_h - 1 && c == 0){
				array_push(new_tim.pixel_data, 0xff);
			}
			else if(c == 0){
				array_push(new_tim.pixel_data, 0xff);
			}
			else if(b == new_tim.pixel_h - 1){
				array_push(new_tim.pixel_data, 0xff);
			}
			else if(c == (new_tim.pixel_w * 2) - 1){
				array_push(new_tim.pixel_data, 0xff);
			}
			else{
				array_push(new_tim.pixel_data, 0x01);
			}
		}
	}	
	
	
	
	ds_list_insert(tim_list, ds_list_size(tim_list), new_tim);
	ui_tim = ds_list_size(tim_list) - 1;
}