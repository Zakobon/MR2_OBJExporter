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
/// @return {Asset.GMSprite} New sprite asset
function grid_rgb_draw(_width, _height, _clut, _alpha, _count, _mult = 2, _grid_size = 4, _grid_mode = 0){
	temp_surface = surface_create(_width, _height);
	new_sprite = -1;
	clut = _clut;
	grid_size = _grid_size;
	width = _width;
	height = _height;
	
	pix_size = 4;
	w = 0;
	h = 0;
	maxbit = array_length(_clut);
	
	index = _count;

	count1 = 3 + (index mod 13);
	count2 = index + ((index div 16) mod (17 - count1));
	//if (count1 == 0){
	//	count1++;
	//}
	//if (count2 == 0){
	//	count2++;
	//}
	//if (count1 == count2){
	//	count1 = (count1 + 1) mod 16;
	//	if (count1 == 0){
	//		count1++;
	//	}
	//}

	surface_set_target(temp_surface);
	draw_clear_alpha(c_white, 0);
	//draw_sprite_stretched_ext(_sprite, _subimg, 0, 0, _width, _height, c_white, _alpha);
	//draw_sprite_ext(Grid1_256x256, _grid, 0, 0, 1, 1, 0, _color, _alpha);
	_grid_mode = 3;
	switch (_grid_mode){//Grid Builder
	case 0:
	#region 0:Flat
	
	bg1 = clut[0];
	bg2 = clut[0];
	for (var i = 0; i < (width * mult) * height; i++){
		switch ((h div pix_size) % grid_size){
			case 0:
			if ((w div pix_size) % grid_size < 1){
				draw_set_colour(clut[(count1) mod maxbit]);
			}
			break;
		
			case 1:
			if ((w div pix_size) % grid_size <= 1){
				draw_set_colour(clut[(count1) mod maxbit]);
			}

			break;
		
			case 2:
			if ((w div pix_size) % grid_size <= 2){
				draw_set_colour(clut[(count1) mod maxbit]);
			}

			
			case 3:
			if ((w div pix_size) % grid_size <= 3){
				draw_set_colour(clut[(count1) mod maxbit]);
			}
			break;

			default:
			break;
		}
		if ((w div pix_size) mod grid_size < 1){
			draw_set_colour(bg1);
		}
		if ((h div pix_size) mod grid_size < 1){
			draw_set_colour(bg2);
		}
		draw_point(0 + w, 0 + h)
		w++;
		if (w >= width * 2){
			w = 0;
			h++;
		}
	}
	#endregion
	break;
	case 1:
	#region 1:Dragonscale
	
	bg1 = clut[count1];
	bg2 = clut[count2];
	for (var i = 0; i < (width * mult) * height; i++){
		switch ((h div pix_size) % grid_size){
			case 0:
			draw_set_colour(clut[(index + 0) mod maxbit]);
			if ((w div pix_size) % grid_size < 1){
				break;
			}
		
			case 1:
			draw_set_colour(clut[(index + 1) mod maxbit]);
			if ((w div pix_size) % grid_size <= 1){
				break;
			}
		
			case 2:
			draw_set_colour(clut[(index + 2) mod maxbit]);
			if ((w div pix_size) % grid_size <= 2){
				break;
			}
		
			case 3:
			draw_set_colour(clut[(index + 3) mod maxbit]);
			if ((w div pix_size) % grid_size <= 3){
				break;
			}
		
			case 4:
			draw_set_colour(clut[(index + 4) mod maxbit]);
			if ((w div pix_size) % grid_size <= 4){
				break;
			}
		
			case 5:
			draw_set_colour(clut[(index + 5) mod maxbit]);
			if ((w div pix_size) % grid_size <= 5){
				break;
			}
		
			case 6:
			draw_set_colour(clut[(index + 6) mod maxbit]);
			if ((w div pix_size) % grid_size <= 6){
				break;
			}
		
			case 7:
			draw_set_colour(clut[(index + 7) mod maxbit]);
			if ((w div pix_size) % grid_size <= 7){
				break;
			}
		
			case 8:
			draw_set_colour(clut[(index + 8) mod maxbit]);
			if ((w div pix_size) % grid_size <= 8){
				break;
			}
				
			default:
			break;
		}
		if ((w div pix_size) % grid_size < 1){
			draw_set_colour(bg1);
		}
		if ((h div pix_size) % grid_size < 1){
			draw_set_colour(bg2);
		}
		draw_point(0 + w, 0 + h)
		w++;
		if (w >= width * 2){
			w = 0;
			h++;
		}
	}
	#endregion
	break
	case 2:
	#region 2:Flower
	
	bg1 = clut[0];
	bg2 = clut[0];
	for (var i = 0; i < (width * mult) * height; i++){
		switch ((h div pix_size) % grid_size){
			case 0:
			if ((w div pix_size) % grid_size == 2){
				draw_set_colour(clut[(count1) mod maxbit]);
			}
			else{
				draw_set_colour(clut[(count2) mod maxbit]);
			}
			break;
		
			case 1:
			if ((w div pix_size) % grid_size != 2){
				draw_set_colour(clut[(count1) mod maxbit]);
			}
			else{
				draw_set_colour(clut[(count2) mod maxbit]);
			}
			break;
		
			case 2:
			if ((w div pix_size) % grid_size == 2){
				draw_set_colour(clut[(count1) mod maxbit]);
			}
			else{
				draw_set_colour(clut[(count2) mod maxbit]);
			}
			break;
			
			case 3:
			if ((w div pix_size) % grid_size != 2){
				draw_set_colour(clut[(count1) mod maxbit]);
			}
			else{
				draw_set_colour(clut[(count2) mod maxbit]);
			}
			break;

			default:
			break;
		}
		if ((w div pix_size) mod grid_size < 1){
			draw_set_colour(bg1);
		}
		if ((h div pix_size) mod grid_size < 1){
			draw_set_colour(bg2);
		}
		draw_point(0 + w, 0 + h)
		w++;
		if (w >= width * 2){
			w = 0;
			h++;
		}
	}
	#endregion
	break;
	case 3:
	#region 3:Weave
	//0101
	//2122
	//0101
	//2221
	bg1 = clut[1];
	c1 = clut[(count1) mod maxbit]
	c2 = clut[(count2) mod maxbit]
	for (var i = 0; i < (width * mult) * height; i++){
		switch ((h div pix_size) % grid_size){
			case 0:
			case 2:
			if ((w div pix_size) % 2 == 0){
				draw_set_colour(bg1);
			}
			else{
				draw_set_colour(c1);
			}
			break;
			
			case 1:
			if ((w div pix_size) % grid_size == 1){
				draw_set_colour(c1);
			}
			else{
				draw_set_colour(c2);
			}
			break;
			
			case 3:
			if ((w div pix_size) % grid_size == 3){
				draw_set_colour(c1);
			}
			else{
				draw_set_colour(c2);
			}
			break;

			default:
			break;
		}
		//if ((w div pix_size) mod grid_size < 1){
		//	draw_set_colour(bg1);
		//}
		//if ((h div pix_size) mod grid_size < 1){
		//	draw_set_colour(bg2);
		//}
		draw_point(0 + w, 0 + h)
		w++;
		if (w >= width * 2){
			w = 0;
			h++;
		}
	}
	#endregion
	break;
	}
	surface_reset_target();
    view_surface_id[0] = temp_surface;
	new_sprite = sprite_create_from_surface(temp_surface, 0, 0, _width, _height, false, false, 0, 0);
	surface_free(temp_surface);
	return new_sprite;
}