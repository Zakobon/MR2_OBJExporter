function tim_rgb_draw(_x = 0, _y = 0, _tim, _alpha = 1, _scalew = 2, _scaleh = 2, _fill = false){

	scale_w = _scalew;
	scale_h = _scaleh;
	tim_px = _tim.pixel_x + _x;
	tim_py = _tim.pixel_y + _y;
	tim_pw = _tim.pixel_w;
	tim_ph = _tim.pixel_h;

	tim_bit = _tim.bit;
	switch (tim_bit){
			case 0:
			mult = 4;
			break;
			
			case 1:
			mult = 2;
			break;
	}
	
	draw_clut = tim_rgb_clut[_tim.clut_y - 505]; //Uses the global CLUT list, NOT the clut supplied as that's not how it works ingame
	
	//Erase area that TIM will be drawn to//
	//This way, fully transparent pixels can be represented when a background is added
	gpu_set_blendmode(bm_subtract);
	draw_set_alpha(1);
	draw_set_colour($FFFFFF);
	draw_rectangle(tim_px * mult, tim_py, (tim_pw * mult) + (tim_px * mult) - 1, (tim_ph + tim_py) - 1, false);
	gpu_set_blendmode(bm_normal);

		

	draw_set_alpha(_alpha);
	h = 0;
	w = 0;
		
	for (var a = 0; a < scale_h; a++){
		for (var b = 0; b < scale_w; b++){
			h = 0;
			for (var i = 0; i < tim_ph * (tim_pw * mult); i++){
				switch (draw_clut[_tim.pixel_data[i]][1]){
					case 0:
					draw_set_alpha(_alpha);
					break;
					
					case 1:
					if (_fill != true){
						if (grid_mode != 1){
							draw_set_alpha(_alpha * .95);
						}
						else{
							draw_set_alpha(_alpha * .80);
						}
					}
					else{
						draw_set_alpha(1);
					}
					break;
					case 2:
					draw_set_alpha(0);
					break;
				}
				draw_point_colour((tim_px * scale_w * mult) + (w) + b, (tim_py * scale_h) + (h) + a, draw_clut[_tim.pixel_data[i] + _tim.clut_x][0]);
				w++;
				if (w >= tim_pw * mult){
					h++;
					w = 0;
				}
			}
		}
	}
	draw_set_alpha(1);
}