/// @description Takes a TIM and updates it's clut_data and pixel_data
/// Modes:
/// 0: [not implemented] Flat 
/// 1: [not implemented] Dragon Scale
/// 2: [not implemented] Flower
/// 3: Weave
/// @param {Real} tim The targeted TIM to be changed
/// @param {Real} count Current iteration of function
/// @param {Real} mult bit mode's mult value for width
function tex_grid_builder(_tim, _count, _mult = 2){
	//pix_size = 4;
	pattern = 0;
	tim = _tim;
	maxbit = 15
	p_data = []; //finished array
	pixel_list = []; //holds each individual pixel
	grid_size = 4;
	width = tim.pixel_w;
	height = tim.pixel_h;
	switch (tim.pixel_x div 64){ //page check
		case 12:
		pattern = grid_mode28[1];
		break;
		
		case 13:
		pattern = grid_mode29[1];
		break;
		
		case 14:
		pattern = grid_mode30[1];
		break;
		
		case 15:
		pattern = grid_mode31[1];
		break;
	
	}
	switch(tim.bit){
		case 0:
		mult = 4;
		break;
		
		case 1:
		mult = 2;
		break;
	}
	switch((width * mult) > height){
		case true:
		pix_size = 1 + height div 15;
		break;
		
		case false:
		pix_size = 1 + (width * mult) div 15;
		break;
	}
	
	
	w = 0;
	h = 0;
	var max_index = 12;
	index = _count;
	
	count1 = index mod max_index;
	count2 = count1 + (((index div 6)) mod (max_index - count1));	//count1 = (count1) mod max_index;
	//count2 = 3 + ((count2) mod (max_index - 3));
	
	if (count1 == count2){
		count1 = 4 + (count1 mod (max_index - 4));
	}
	c1 = count1;
	c2 = count2;
	//if (count1 < count2){
	//	bg1 = 13;
	//}
	//else{
	//	bg1 = 14;
	//}
	bg1 = 14;
	switch (pattern){//Grid Pattern
	case 0:
	#region 0:Blended
	//0101
	//2122
	//0101
	//2221

	for (var i = 0; i < (width * mult) * height; i++){
		p_data = tim.clut_data[tim.pixel_data[i]];
		if (p_data.red + p_data.green + p_data.blue + p_data.stp == 0){
			pixel = 15;
		}
		else if (w mod (grid_size * pix_size) == 0){
			pixel = bg1;
		}
		else if (h mod (grid_size * pix_size) == 0){
			pixel = bg1;
		}
		else{
			switch (h % 2){
				
				case 0:
				if (w % 2 == 0){
					pixel = c1;
				}
				else{
					pixel = c2;
				}
				break;
			
				case 1:
				if (w % 2 == 1){
					pixel = c1;
				}
				else{
					pixel = c2;
				}
				break;

				default:
				break;
			}
		}
		
		array_push(pixel_list, pixel);
		w++;
		if (w >= width * mult){
			w = 0;
			h++;
		}
	}
	#endregion
	break;
	
	case 1:
	#region 1:ZigZag

	for (var i = 0; i < (width * mult) * height; i++){
		p_data = tim.clut_data[tim.pixel_data[i]];
		//Full Transparency
		if (p_data.red + p_data.green + p_data.blue + p_data.stp == 0){
			pixel = 15;
		}
		//<Grid Lines>
		else if (w mod (grid_size * pix_size) == 0){
			pixel = bg1;
		}
		else if (h mod (grid_size * pix_size) == 0){
			pixel = bg1;
		}
		else{
			switch ((h div pix_size) % grid_size){
				case 0:
				if ((w div pix_size) % grid_size == 0){
					pixel = c1;
				}
				else{
					pixel = c2;
				}
				break;
			
				case 1:
				if ((w div pix_size) % grid_size == 1){
					pixel = c2;
				}
				else{
					pixel = c1;
				}
				break;
				
				case 2:
				if ((w div pix_size) % grid_size == 2){
					pixel = c1;
				}
				else{
					pixel = c2;
				}
				break;
			
				case 3:
				if ((w div pix_size) % grid_size == 3){
					pixel = c2;
				}
				else{
					pixel = c1;
				}
				break;
				
				default:
				break;
			}
		}
		
		
		array_push(pixel_list, pixel);
		w++;
		if (w >= width * mult){
			w = 0;
			h++;
		}
	}
	#endregion
	break
	
	case 2:
	#region 2:Weave
	//0101
	//2122
	//0101
	//2221

	for (var i = 0; i < (width * mult) * height; i++){
		p_data = tim.clut_data[tim.pixel_data[i]];
		if (p_data.red + p_data.green + p_data.blue + p_data.stp == 0){
			pixel = 15;
		}
		else if (w mod (grid_size * pix_size) == 0){
			pixel = bg1;
		}
		else if (h mod (grid_size * pix_size) == 0){
			pixel = bg1;
		}
		else{
			switch ((h div pix_size) % grid_size){
				case 0:
				case 2:
				if ((w div pix_size) % 2 == 0){
					pixel = bg1;
				}
				else{
					pixel = c1;
				}
				break;
			
				case 1:
				if ((w div pix_size) % grid_size == 1){
					pixel = c1;
				}
				else{
					pixel = c2;
				}
				break;
			
				case 3:
				if ((w div pix_size) % grid_size == 3){
					pixel = c1;
				}
				else{
					pixel = c2;
				}
				break;

				default:
				break;
			}
		}
		
		array_push(pixel_list, pixel);
		w++;
		if (w >= width * mult){
			w = 0;
			h++;
		}
	}
	#endregion
	break;
	
	case 3:
	#region 3:Tile

	for (var i = 0; i < (width * mult) * height; i++){
		p_data = tim.clut_data[tim.pixel_data[i]];
		if (p_data.red + p_data.green + p_data.blue + p_data.stp == 0){
			pixel = 15;
		}
		else if (w mod (grid_size * pix_size) == 0){
			pixel = bg1;
		}
		else if (h mod (grid_size * pix_size) == 0){
			pixel = bg1;
		}
		else{
			switch ((h div pix_size) % grid_size){
				case 0:
				switch ((w div pix_size) % grid_size){
					case 0:
					pixel = c1;
					break;
					case 1:
					pixel = c2;
					break;
					case 2:
					pixel = c1;
					break;
					case 3:
					pixel = c1;
					break;
				}
				break;
				
				case 1:
				switch ((w div pix_size) % grid_size){
					case 0:
					pixel = c2;
					break;
					case 1:
					pixel = c1;
					break;
					case 2:
					pixel = c2;
					break;
					case 3:
					pixel = c2;
					break;
				}
				break;
			
				case 2:
				switch ((w div pix_size) % grid_size){
					case 0:
					pixel = c1;
					break;
					case 1:
					pixel = c2;
					break;
					case 2:
					pixel = c1;
					break;
					case 3:
					pixel = c1;
					break;
				}
				break;
			
				case 3:
				switch ((w div pix_size) % grid_size){
					case 0:
					pixel = c1;
					break;
					case 1:
					pixel = c2;
					break;
					case 2:
					pixel = c1;
					break;
					case 3:
					pixel = c2;
					break;
				}
				break;

				default:
				draw_set_colour(bg1);
				break;
			}
			
		}
		
		array_push(pixel_list, pixel);
		w++;
		if (w >= width * mult){
			w = 0;
			h++;
		}
	}
	#endregion
	break;
	}
	switch(tim.bit){
		case 0:
		for (var a = 0; a < 16;a++){
			tim.clut_data[a].red = round(colour_get_red(grid_data_clut4bit[a]) / 8);
			tim.clut_data[a].green = round(colour_get_green(grid_data_clut4bit[a]) / 8);
			tim.clut_data[a].blue = round(colour_get_blue(grid_data_clut4bit[a]) / 8);
		}
		break;
		
		case 1:
		for (var a = 0; a < 256;a++){
			tim.clut_data[a].red = round(colour_get_red(grid_data_clut4bit[a mod 16]) / 8);
			tim.clut_data[a].green = round(colour_get_green(grid_data_clut4bit[a mod 16]) / 8);
			tim.clut_data[a].blue = round(colour_get_blue(grid_data_clut4bit[a mod 16]) / 8);
		}
		break;
	}
	tim.pixel_data = pixel_list;
	return tim;
}