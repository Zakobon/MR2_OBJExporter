/// @description Takes a TIM and updates it's clut_data and pixel_data
/// Modes:
/// 0: [not implemented] Flat 
/// 1: [not implemented] Dragon Scale
/// 2: [not implemented] Flower
/// 3: Weave
/// @param {Real} tim The targeted TIM to be changed

function tex_grid_builder(_tim){
	//pix_size = 4;
	var pattern = 0;
	var variant = 0;
	var tim = _tim;
	var clut = -1;
	//maxbit = 15
	var pixel = 0;
	var p_data = []; //finished array
	var c_data = tim.clut_data;
	var pixel_list = []; //holds each individual pixel
	
	//grid_size = 4;
	var width = tim.pixel_w;
	var height = tim.pixel_h;
	var clut_cap = array_length(grid_data_clut8bit); //prevents indexing more colors than exists
	
	switch(tim.bit){
		case 0:
		mult = 4;
		transparent = 7;
		st_off = 8;
		max_ind = 32;
		clut = grid_data_clut4bit;
		break;
		
		case 1:
		mult = 2;
		transparent = 15;
		st_off = 128;
		max_ind = 256;
		clut = grid_data_clut8bit;
		break;
	}
	switch (tim.pixel_x div 64){
		case 12:
		pattern = grid_mode28[1];
		variant = grid_mode28[2];
		break;
		
		case 13:
		pattern = grid_mode29[1];
		variant = grid_mode29[2];
		break;
		
		case 14:
		pattern = grid_mode30[1];
		variant = grid_mode30[2];
		break;
		
		case 15:
		pattern = grid_mode31[1];
		variant = grid_mode31[2];
		break;
	}
	//BUILD Pixel Data
	var pixel_grid = get_pdata(tim, tex_grid[pattern][variant]);
	for (var a = 0; a < array_length(pixel_grid);a++){
		c_rgb = c_data[tim.pixel_data[a]];
		pixel = pixel_grid[a];
		if (c_rgb.stp == 1){ //check old tex for semitransparency
			pixel += st_off;
		}
		else if (c_rgb.red + c_rgb.green + c_rgb.blue + c_rgb.stp == 0){//check old tex for full transparency
			pixel = transparent;
		}
		array_push(pixel_list, pixel);
	}
	//Build CLUTs
	for (var a = 0; a < max_ind;a++){
		
		if (a == st_off - 1){//fully transparent
			tim.clut_data[a mod clut_cap].red = 0;
			tim.clut_data[a mod clut_cap].green = 0;
			tim.clut_data[a mod clut_cap].blue = 0;
			tim.clut_data[a mod clut_cap].stp = 0;
			continue;
		}
		if ((a mod 128) > clut_cap){ //fill unnassigned cluts with near black
			tim.clut_data[a mod clut_cap].red = 0;
			tim.clut_data[a mod clut_cap].green = 0;
			tim.clut_data[a mod clut_cap].blue = 1;
			tim.clut_data[a mod clut_cap].stp = 0;
		}
		else if (a < st_off){//opaque
			tim.clut_data[a mod clut_cap].red = round(colour_get_red(clut[a mod clut_cap]) / 8);
			tim.clut_data[a mod clut_cap].green = round(colour_get_green(clut[a mod clut_cap]) / 8);
			tim.clut_data[a mod clut_cap].blue = round(colour_get_blue(clut[a mod clut_cap]) / 8);
			tim.clut_data[a mod clut_cap].stp = 0;
		}
		else {//semi-transparent
			tim.clut_data[a mod clut_cap].red = round(colour_get_red(clut[a mod clut_cap]) / 8);
			tim.clut_data[a mod clut_cap].green = round(colour_get_green(clut[a mod clut_cap]) / 8);
			tim.clut_data[a mod clut_cap].blue = round(colour_get_blue(clut[a mod clut_cap]) / 8);
			tim.clut_data[a mod clut_cap].stp = 1;
		}
	}
	tim.pixel_data = pixel_list;
	return tim;
}