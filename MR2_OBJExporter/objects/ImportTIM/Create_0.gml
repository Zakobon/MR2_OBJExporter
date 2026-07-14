

globalvar tim_buffer;
tim_buffer = -1;

filename_input = "";
tim_buffer_list = [];

filename_input = get_open_filename_ext("MRDX TIM Files|*.tex", "", "","Open MRDX TEX/TIM File");

if (filename_input != "") {
    tim_buffer = buffer_load(filename_input);
    buffer_seek(tim_buffer, buffer_seek_start, 0);
	ds_list_clear(tim_list);
 }
else{
	instance_destroy();
	exit;
}

globalvar ui_name_tex;
ui_name_tex = "None";

filename_array = string_split(filename_input, "\\");
ui_name_tex = filename_array[array_length(filename_array) - 1];

while (filename_input != "" && buffer_tell(tim_buffer) + 16 < buffer_get_size(tim_buffer)) {
	tim = {
		imported : 1,
		filename : "[Null]", //for importing/exporting TIMs, not TEX
		file_id : 0x10,
		version : 0x00, //always 0x00
		bit_flag : 0x09, //(bit0-2=Type; bit3=HasCLUT bit4-31=Reserved/zero)
		
		bit : 0, //0bx111
		bit_old : 0, //bitmode on import
		has_clut : 0, //1xxx
		t_edit : -1, //-1 = unedited transparency values
		clut_size : 0,
		clut_x : 0,
		clut_y : 0,
		clut_w : 0,
		clut_h : 0,
		clut_data : [],
	
		pixel_size : 0,
		pixel_x : 0,
		pixel_y : 0,
		pixel_w : 0,
		pixel_h : 0,
		pixel_data : [],

	}
	clut_entry = {
		red : 0,
		green : 0,
		blue : 0,
		stp : 0 //transparency control bit - 0/!0-!0-!0 for opaque, 1/X-X-X for semi-transparent 0/0-0-0 for full transparency
	}
	
	tim.file_id = buffer_read(tim_buffer, buffer_u32);
	tim.bit_flag = buffer_read(tim_buffer, buffer_u32);
	tim.bit = tim.bit_flag & 0b111;
	tim.bit_old = tim.bit_flag & 0b111;
	tim.has_clut = (tim.bit_flag >> 3) & 0b1; 
	tim.clut_size = buffer_read(tim_buffer, buffer_u32);
	tim.clut_x = buffer_read(tim_buffer, buffer_u16);
	tim.clut_y = buffer_read(tim_buffer, buffer_u16);
	tim.clut_w = buffer_read(tim_buffer, buffer_u16);
	tim.clut_h = buffer_read(tim_buffer, buffer_u16);
	
	tim.clut_data = [];
	
	
	for (var i = 0; i < tim.clut_w * tim.clut_h; i++) {
		var entry = buffer_read(tim_buffer, buffer_u16);
		clut_entry = {
			red : entry & 0b11111,
			green : (entry >> 5) & 0b11111,
			blue : (entry >> 10) & 0b11111,			
			stp : (entry >> 15) & 0b1
		}
		array_push(tim.clut_data, clut_entry);
	}
	
	tim.pixel_size = buffer_read(tim_buffer, buffer_u32);
	tim.pixel_x = buffer_read(tim_buffer, buffer_u16);
	if(tim.pixel_x < 768 || tim.pixel_x >= 1024){ //x start of page 28
		show_message("[Error]: Imported File's X Coordinates Are Out of Bounds!!\n" + 
		"    Did you import the correct .tex?\n\n" +
		"[Example]: \"mx_mx|Monol/Monol\"\n\n" +
		"    Valid Target:\n" +
		"        mx_mx.tex -> (model textures)\n\n" +
		"    Invalid Targets:\n" +
		"        mx_mx_et.tex -> (sfx effects)\n" +
		"        mx_mx_wt.tex -> (tech icons)\n" +
		"        mx_mx_bt.tex -> (battle sfx effects & tech icons)" 
		);
		buffer_delete(tim_buffer);
		instance_destroy();
		exit;
	}
	tim.pixel_y = buffer_read(tim_buffer, buffer_u16);
	tim.pixel_w = buffer_read(tim_buffer, buffer_u16);
	tim.pixel_h = buffer_read(tim_buffer, buffer_u16);
	
	tim.pixel_data = [];
	
	switch (tim.bit){
		case 0:
		for (var i = 0; i < tim.pixel_w * tim.pixel_h; i++) {
			var entry = buffer_read(tim_buffer, buffer_u16);
			first = entry & 0b1111;
			second = (entry >> 4) & 0b1111;
			third = (entry >> 8) & 0b1111;
			forth = (entry >> 12) & 0b1111;
			array_push(tim.pixel_data, first);
			array_push(tim.pixel_data, second);
			array_push(tim.pixel_data, third);
			array_push(tim.pixel_data, forth);
		}
		break;
		
		case 1:
		for (var i = 0; i < tim.pixel_w * tim.pixel_h; i++) {
			var entry = buffer_read(tim_buffer, buffer_u16);
			first = entry & 0b1111_1111;
			second = (entry >> 8) & 0b1111_1111;
			array_push(tim.pixel_data, first);
			array_push(tim.pixel_data, second);
		}
		break;
	}
	array_push(tim_buffer_list, tim);
}
for (var a = 0; a < array_length(tim_buffer_list); a++){
	ds_list_insert(tim_list, a, tim_buffer_list[a]);
}
for (var a = 0; a < array_length(tim_buffer_list); a++){
	tim_rgb_build(tim_buffer_list[a]);
	//array_push(tim_rgb_clut, clut);
}
ui_tim = -1;
ui_obj = 0;
ui_prim = 0;
ui_page = 28;