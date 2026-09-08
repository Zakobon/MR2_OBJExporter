function tex_builder(){
	tex_buffer = buffer_create(4, buffer_grow, 1);
	buffer_seek(tex_buffer, buffer_seek_start, 0);
	grid_flag = true;
	//Variables to keep count of color index per pattern
	index_blended = 0;
	index_zigzag = 0;
	index_weave = 0;
	index_tile = 0;
	
	for (var a = 0; a < ds_list_size(tim_list); a++){
		import_flag = tim_list[|a].imported;
		image_w = tim_list[|a].pixel_w;
		image_h = tim_list[|a].pixel_h;
		clut_x = tim_list[|a].clut_x;
		if (tim_list[|a].clut_y > 511){
			tim_list[|a].clut_y = 505;
		}
		clut_y = tim_list[|a].clut_y;
		clut_w = tim_list[|a].clut_w;
		clut_h = tim_list[|a].clut_h;
		bit_mode = tim_list[|a].bit & 0b111;
		bit_old = tim_list[|a].bit_old & 0b111;
		clut_flag = (tim_list[|a].has_clut & 0b1) << 3;
		clut_array = tim_data_clut[clut_y - 505]; //example: tim_data_clut[y - 505][clut_index].red
		
		switch (bit_mode){
			case 0:
			mult = 4;
			g_clut = tex_data_clut4bit;
			//if (tex_flat == true){
			//	g_clut = tex_flat4bit;
			//}
			break;
			
			case 1:
			mult = 2;
			g_clut = tex_data_clut8bit;
			//if (tex_flat == true){
			//	g_clut = tex_flat8bit;
			//}
			break;
		}

		tim_list[|a] = tex_grid_builder(tim_list[|a]); //Convert clut and pixel data to grid format
		
		
		flag = (bit_mode) | (clut_flag);
		
		
		//TIM header
		buffer_write(tex_buffer, buffer_u32, 0x10);
		buffer_write(tex_buffer, buffer_u32, flag);
		

		buffer_write(tex_buffer, buffer_u32, 12 + ((clut_w * clut_h) * 2));//pointer to end of clut data
		buffer_write(tex_buffer, buffer_u16, tim_list[|a].clut_x);
		buffer_write(tex_buffer, buffer_u16, tim_list[|a].clut_y);
		buffer_write(tex_buffer, buffer_u16, clut_w);
		buffer_write(tex_buffer, buffer_u16, clut_h);
		
		for (var b = 0; b < clut_w; b++){
			//rgb_data = tim_list[|a].clut_data[b];
			clut_data = g_clut[b].red & 0b11111;
			clut_data = clut_data | ((g_clut[b].green & 0b11111) << 5);
			clut_data = clut_data | ((g_clut[b].blue & 0b11111) << 10);
			clut_data = clut_data | ((g_clut[b].stp & 0b1) << 15);
			buffer_write(tex_buffer, buffer_u16, clut_data);
		}

	
		
		//Pixel header
		buffer_write(tex_buffer, buffer_u32, 12 + ((image_w * image_h) * 2));//pointer to end of Pixel data
		buffer_write(tex_buffer, buffer_u16, tim_list[|a].pixel_x);
		buffer_write(tex_buffer, buffer_u16, tim_list[|a].pixel_y);
		buffer_write(tex_buffer, buffer_u16, tim_list[|a].pixel_w);
		buffer_write(tex_buffer, buffer_u16, tim_list[|a].pixel_h);
		
		//Pixel data
		
		switch (bit_mode){
			case 0:
			for (var b = 0; b < image_w  * image_h * mult; b++){
				pixel_data = tim_list[|a].pixel_data[b] & 0b1111;
				b++;
				pixel_data = pixel_data | ((tim_list[|a].pixel_data[b] & 0b1111) << 4);
				b++;
				pixel_data = pixel_data | ((tim_list[|a].pixel_data[b] & 0b1111) << 8);
				b++;
				pixel_data = pixel_data | ((tim_list[|a].pixel_data[b] & 0b1111) << 12);

				buffer_write(tex_buffer, buffer_u16, pixel_data);
			}
			break;
			
			case 1:
			for (var b = 0; b < image_w * image_h * mult; b++){
				pixel_data = tim_list[|a].pixel_data[b] & 0b1111_1111;
				b++;
				pixel_data = pixel_data | ((tim_list[|a].pixel_data[b] & 0b1111_1111) << 8);

				buffer_write(tex_buffer, buffer_u16, pixel_data);
			}
			break;
		}
	}
}