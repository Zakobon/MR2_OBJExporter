/// @desc Creates the pixeldata required for a TIM file.
/// @param {real} grid_size Size in pixels of each grid square
/// @param {constant.Color} grid_color Color of the grid squares
/// @param {constant.Color} line_color Color of the grid lines

function tex_create_grid(_tim, _grid_size, _grid_color, _line_color){

	draw_clut = tim_rgb_clut[_tim.clut_y - 505]; //need to make new cluts for grids
	width = _tim.pixel_w;
	height = _tim.pixel_h;
	bitmode = _tim.bit;
	color_grid = _grid_color;
	color_line = _line_color;
	grid_size = _grid_size;
	
	switch (bitmode){
		case 0: 
		mult = 4;
		break;
		
		case 1:
		mult = 2;
		break;
	}
	
	w = 0
	h = 0;
	for (var i = 0; i < (width * 2) * height; i++){
		switch (draw_clut[_tim.pixel_data[i]][1]){
			case 2:
			draw_set_alpha(0);
			break;
				
			case 1:
			draw_set_alpha(.5);
			break;
				
			case 0:
			draw_set_alpha(1);
			break;
		}
		switch !(h % grid_size){
			case 0:
			switch !(w % grid_size){
				case 0:
				draw_set_colour(color_grid);
				break;
				
				default:
				draw_set_colour(color_line)
			}
			break;
				
			default:
			draw_set_colour(color_line);
		}
		draw_point(x + w, y + h)
		w++;
		if (w >= width * 2){
			w = 0;
			h++;
		}
	}
}