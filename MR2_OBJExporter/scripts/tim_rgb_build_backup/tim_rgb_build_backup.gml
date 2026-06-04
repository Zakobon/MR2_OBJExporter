function tim_rgb_build_backup(_tim){
	
	dclut = [[],[]];
	dstp = 0;

	switch (_tim.bit){
		case 0:
		if (tim_rgb_4clut[_tim.clut_y - 505][_tim.clut_x] != 0){
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

				dcolor = make_colour_rgb(dred, dgreen, dblue);
				dclut[b][0] = dcolor;
		
				dclut[b][1] = dstp;
			}
			tim_rgb_4clut[_tim.clut_y - 505][_tim.clut_x] = dclut;
		}
		break;

		case 1:
		if (tim_rgb_8clut[_tim.clut_y - 505][_tim.clut_x] != 0){
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
				make_colour_rgb(dred, dgreen, dblue);
				
				dclut[b][0] = make_colour_rgb(dred, dgreen, dblue);
		
				dclut[b][1] = dstp;
			}
			tim_rgb_8clut[_tim.clut_y - 505][_tim.clut_x] = dclut;
		}
		break;
	}
}