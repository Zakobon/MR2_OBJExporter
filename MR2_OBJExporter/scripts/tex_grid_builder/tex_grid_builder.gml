/// @description Takes a color and returns the sprite of a colored grid
/// Modes:
/// 0:Flat
/// 1:Dragon Scale
/// 2:Flower
/// @param {Real} w The width of the grid
/// @param {Real} h The height of the grid
/// @param {Array} clut The clut the grid will draw from
/// @param {Real} alpha The alpha of the sprite
/// @param {Real} count Current iteration of function
/// @param {Real} mult Mult value for width. Default:2
/// @param {Real} [grid_size] Block Size of grid, border line included. Default:8
/// @param {Real} [grid_mode] Grid pattern used. Default:0
/// @return {Array} New pixel data
function tex_grid_builder(_tim, _count, _mult = 2){
	pix_size = 4;
	pattern = 3;
	tim = _tim;
	
	p_data = []; //finished array
	pixel_list = []; //holds each individual pixel
	grid_size = 4;
	width = tim.pixel_w;
	height = tim.pixel_h;
	switch(tim.bit){
		case 0:
		mult = 4;
		for (var a = 0; a < 16;a++){
			tim.clut_data[a].red = round(colour_get_red(grid_data_clut4bit[a]) / 8);
			tim.clut_data[a].green = round(colour_get_green(grid_data_clut4bit[a]) / 8);
			tim.clut_data[a].blue = round(colour_get_blue(grid_data_clut4bit[a]) / 8);
		}
		break;
		
		case 1:
		mult = 2;
		for (var a = 0; a < 256;a++){
			tim.clut_data[a].red = round(colour_get_red(grid_data_clut4bit[a mod 16]) / 8);
			tim.clut_data[a].green = round(colour_get_green(grid_data_clut4bit[a mod 16]) / 8);
			tim.clut_data[a].blue = round(colour_get_blue(grid_data_clut4bit[a mod 16]) / 8);
		}
		break;
	}
	
	w = 0;
	h = 0;
	
	index = _count;

	count1 = 3 + (index mod 13);
	count2 = index + ((index div 16) mod (17 - count1));
	
	switch (pattern){//Grid Pattern
	case 0:
	#region 0:Flat [disabled]
	
	//bg1 = clut[0];
	//bg2 = clut[0];
	//for (var i = 0; i < (width * mult) * height; i++){
	//	switch ((h div pix_size) % grid_size){
	//		case 0:
	//		if (w % grid_size < 1){
	//			draw_set_colour(clut[(count1) mod maxbit]);
	//		}
	//		break;
		
	//		case 1:
	//		if (w % grid_size <= 1){
	//			draw_set_colour(clut[(count1) mod maxbit]);
	//		}

	//		break;
		
	//		case 2:
	//		if (w % grid_size <= 2){
	//			draw_set_colour(clut[(count1) mod maxbit]);
	//		}

			
	//		case 3:
	//		if (w % grid_size <= 3){
	//			draw_set_colour(clut[(count1) mod maxbit]);
	//		}
	//		break;

	//		default:
	//		break;
	//	}
	//	if (w mod grid_size < 1){
	//		draw_set_colour(bg1);
	//	}
	//	if ((h div pix_size) mod grid_size < 1){
	//		draw_set_colour(bg2);
	//	}
	//	draw_point(0 + w, 0 + h)
	//	w++;
	//	if (w >= width * 2){
	//		w = 0;
	//		h++;
	//	}
	//}
	#endregion
	break;
	case 1:
	#region 1:Dragonscale [disabled]
	
	//bg1 = clut[count1];
	//bg2 = clut[count2];
	//for (var i = 0; i < (width * mult) * height; i++){
	//	switch ((h div pix_size) % grid_size){
	//		case 0:
	//		draw_set_colour(clut[(index + 0) mod maxbit]);
	//		if (w % grid_size < 1){
	//			break;
	//		}
		
	//		case 1:
	//		draw_set_colour(clut[(index + 1) mod maxbit]);
	//		if (w % grid_size <= 1){
	//			break;
	//		}
		
	//		case 2:
	//		draw_set_colour(clut[(index + 2) mod maxbit]);
	//		if (w % grid_size <= 2){
	//			break;
	//		}
		
	//		case 3:
	//		draw_set_colour(clut[(index + 3) mod maxbit]);
	//		if (w % grid_size <= 3){
	//			break;
	//		}
		
	//		case 4:
	//		draw_set_colour(clut[(index + 4) mod maxbit]);
	//		if (w % grid_size <= 4){
	//			break;
	//		}
		
	//		case 5:
	//		draw_set_colour(clut[(index + 5) mod maxbit]);
	//		if (w % grid_size <= 5){
	//			break;
	//		}
		
	//		case 6:
	//		draw_set_colour(clut[(index + 6) mod maxbit]);
	//		if (w % grid_size <= 6){
	//			break;
	//		}
		
	//		case 7:
	//		draw_set_colour(clut[(index + 7) mod maxbit]);
	//		if (w % grid_size <= 7){
	//			break;
	//		}
		
	//		case 8:
	//		draw_set_colour(clut[(index + 8) mod maxbit]);
	//		if (w % grid_size <= 8){
	//			break;
	//		}
				
	//		default:
	//		break;
	//	}
	//	if (w % grid_size < 1){
	//		draw_set_colour(bg1);
	//	}
	//	if ((h div pix_size) % grid_size < 1){
	//		draw_set_colour(bg2);
	//	}
	//	draw_point(0 + w, 0 + h)
	//	w++;
	//	if (w >= width * 2){
	//		w = 0;
	//		h++;
	//	}
	//}
	#endregion
	break
	case 2:
	#region 2:Flower [disabled]
	
	//bg1 = clut[0];
	//bg2 = clut[0];
	//for (var i = 0; i < (width * mult) * height; i++){
	//	switch ((h div pix_size) % grid_size){
	//		case 0:
	//		if (w % grid_size == 2){
	//			draw_set_colour(clut[(count1) mod maxbit]);
	//		}
	//		else{
	//			draw_set_colour(clut[(count2) mod maxbit]);
	//		}
	//		break;
		
	//		case 1:
	//		if (w % grid_size != 2){
	//			draw_set_colour(clut[(count1) mod maxbit]);
	//		}
	//		else{
	//			draw_set_colour(clut[(count2) mod maxbit]);
	//		}
	//		break;
		
	//		case 2:
	//		if (w % grid_size == 2){
	//			draw_set_colour(clut[(count1) mod maxbit]);
	//		}
	//		else{
	//			draw_set_colour(clut[(count2) mod maxbit]);
	//		}
	//		break;
			
	//		case 3:
	//		if (w % grid_size != 2){
	//			draw_set_colour(clut[(count1) mod maxbit]);
	//		}
	//		else{
	//			draw_set_colour(clut[(count2) mod maxbit]);
	//		}
	//		break;

	//		default:
	//		break;
	//	}
	//	if (w mod grid_size < 1){
	//		draw_set_colour(bg1);
	//	}
	//	if ((h div pix_size) mod grid_size < 1){
	//		draw_set_colour(bg2);
	//	}
	//	draw_point(0 + w, 0 + h)
	//	w++;
	//	if (w >= width * 2){
	//		w = 0;
	//		h++;
	//	}
	//}
	#endregion
	break;
	case 3:
	#region 3:Weave
	//0101
	//2122
	//0101
	//2221
	bg1 = 1;
	for (var i = 0; i < (width * mult) * height; i++){
		pixel = 0;
		switch ((h div pix_size) % grid_size){
			case 0:
			case 2:
			if ((w div pix_size) % 2 == 0){
				pixel = bg1;
			}
			else{
				pixel = count1;
			}
			break;
			
			case 1:
			if ((w div pix_size) % grid_size == 1){
				pixel = count1;
			}
			else{
				pixel = count2;
			}
			break;
			
			case 3:
			if ((w div pix_size) % grid_size == 3){
				pixel = count1;
			}
			else{
				pixel = count2;
			}
			break;

			default:
			break;
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
	tim.pixel_data = pixel_list;
	return tim;
}