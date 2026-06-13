function tim_rgb_build(_tim){
	switch (_tim.bit){
		case 0:
		count = 16;
		break;
		case 1:
		count = 256;
		break;
	}
	dclut = [[],[]];
	dstp = 0;
	for (var b = 0; b < _tim.clut_w; b++){
			
		cred = _tim.clut_data[b].red;
		cgreen = _tim.clut_data[b].green;
		cblue = _tim.clut_data[b].blue;
		cstp = _tim.clut_data[b].stp;
		dstp = cstp;
		
		if (cred + cgreen + cblue + cstp == 0){
			dstp = 2;
		}

		dred = cred * 8;
		dgreen = cgreen * 8;
		dblue = cblue * 8;
		
		dclut[b][0] = make_colour_rgb(dred, dgreen, dblue);

		dclut[b][1] = dstp;
		
		tim_data_clut[_tim.clut_y - 505][b + _tim.clut_x].red = _tim.clut_data[b].red;
		tim_data_clut[_tim.clut_y - 505][b + _tim.clut_x].green = _tim.clut_data[b].green;
		tim_data_clut[_tim.clut_y - 505][b + _tim.clut_x].blue = _tim.clut_data[b].blue;
		tim_data_clut[_tim.clut_y - 505][b + _tim.clut_x].stp = _tim.clut_data[b].stp;
	}
	for (var c = 0; c < count; c++){
		index = _tim.clut_x + c;
		tim_rgb_clut[_tim.clut_y - 505][index][0] = dclut[c][0];
		tim_rgb_clut[_tim.clut_y - 505][index][1] = dclut[c][1];
	}
	//updates clut surface with new values
	if !(surface_exists(draw_ui_clut)){
		draw_ui_clut = surface_create(1024, 16);
	}
	surface_set_target(draw_ui_clut);
	draw_clear_alpha(c_black, 0);
	height = 4;
	width = 4;
	for (var a = 0; a < array_length(tim_rgb_clut); a++){
		for (var b = 0; b < array_length(tim_rgb_clut[a]); b++){
			for (var h = 0; h < height; h++){
				for (var w = 0; w < width; w++){
					draw_point_colour((b * height) + h, (a * width) + w, tim_rgb_clut[a][b][0]);
				}
			}
		}
	}
	surface_reset_target();
	view_surface_id[0] = draw_ui_clut;
	
}