
//draw_text(x, y, string(sprite));
//draw_sprite(sprite, 0, x, y + 24)
var test_button_active = variable_instance_get(test_button, "active");

if (test_button_active == 1){
	//variable_instance_set(test_button, "active", 0);
	if !(timer % 15){
		count++;
	}
	//if (count > ds_list_size(tim_list) - 3){
	//	count = ds_list_size(tim_list) - 3;
	//}
	//draw_clut = tim_rgb_clut[tim_list[|count].clut_y - 505];
	//width = tim_list[|count].pixel_w;
	//height = tim_list[|count].pixel_h;
	grid_size = 16;
	color_bg = c_black;
	w = 0
	h = 0;
	width = 80;
	height = 80;
	for (var i = 0; i < (width * 2) * height; i++){
		//switch (draw_clut[tim_list[|count].pixel_data[i]][1]){
		//	case 2:
		//	draw_set_alpha(0);
		//	break;
				
		//	case 1:
		//	draw_set_alpha(.5);
		//	break;
				
		//	case 0:
		//	draw_set_alpha(1);
		//	break;
		//}
		color_block = grid_colors[count];
		switch ((h div 2) % (grid_size )){
			case 1:
			case 2:
			draw_set_colour(grid_data_clut8bit[6]);
				
			default:
			draw_set_colour(color_bg);
			break;
		}
		#region testing [disabled]
		//switch (h % (grid_size )){
		//	case 1:
		//	case 2:
		//	switch !(w % grid_size){
		//		case 1:
		//		case 2:
		//		draw_set_colour(grid_data_clut8bit[6]);
		//		break;
				
		//		default:
		//		draw_set_colour(color_bg)
		//	}
		//	break;
			
		//	case 3:
		//	case 4:
		//	switch (w % (grid_size div 2)){
		//		case 1:
		//		case 2:
		//		draw_set_colour(grid_data_clut8bit[6]);
		//		break;
				
		//		default:
		//		draw_set_colour(color_bg)
		//	}
		//	break;
				
		//	default:
		//	draw_set_colour(color_bg);
		//	break;
		//}
		#endregion
		draw_point(x + w, y + h)
		w++;
		if (w >= width * 2){
			w = 0;
			h++;
		}
	}
	timer++;
	draw_set_alpha(1);
}
#region Color inversion tests

dx = mouse_x;
dy = mouse_y;
////draw_set_colour(grid_data_clut8bit[(timer div 30) mod 26]);
//draw_rectangle(dx, dy, dx - 20, dy + 20, false);
//draw_text(dx, dy - 20, string((timer div 30) mod 26))

#endregion
grid_size = 4;
width = 80;
height = 80;
w = 0;
h = 0;
index = 16;
for (var i = 0; i < (width * 2) * height; i++){
	
	color_bg = c_black;
	switch ((h div 4) % grid_size){
		case 0:
		draw_set_colour(grid_data_clut8bit[index + 0]);
		if ((w div 4) % grid_size < 1){
			break;
		}
		
		case 1:
		draw_set_colour(grid_data_clut8bit[index + 1]);
		if ((w div 4) % grid_size <= 1){
			break;
		}
		
		case 2:
		draw_set_colour(grid_data_clut8bit[index + 2]);
		if ((w div 4) % grid_size <= 2){
			break;
		}
		
		//case 3:
		//draw_set_colour(grid_data_clut8bit[index + 3]);
		//if ((w div 4) % grid_size <= 3){
		//	break;
		//}
		
		//case 4:
		//draw_set_colour(grid_data_clut8bit[index + 4]);
		//if ((w div 4) % grid_size <= 4){
		//	break;
		//}
		
		//case 5:
		//draw_set_colour(grid_data_clut8bit[index + 5]);
		//if ((w div 4) % grid_size <= 5){
		//	break;
		//}
		
		//case 6:
		//draw_set_colour(grid_data_clut8bit[index + 6]);
		//if ((w div 4) % grid_size <= 6){
		//	break;
		//}
				
		default:
		draw_set_colour(color_bg);
		break;
	}
	draw_point(x + w, y + h)
	w++;
	if (w >= width * 2){
		w = 0;
		h++;
	}
}