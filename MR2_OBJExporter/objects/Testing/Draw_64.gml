
//draw_text(x, y, string(sprite));
//draw_sprite(sprite, 0, x, y + 24)
var test_button_active = variable_instance_get(test_button, "active");

if (test_button_active == 1){
	variable_instance_set(test_button, "active", 0);
	if !(instance_exists(ImportTIM)){
		exit;
	}
	tex_builder();
	filename = string_delete(ui_name_tex, string_length(ui_name_tex) - 3, 4);
	tex_path = string("{0}{1}.tex", user_filepath, filename);
	buffer_save(tex_buffer, tex_path);
}
exit;
#region Color inversion tests

dx = mouse_x;
dy = mouse_y;
////draw_set_colour(grid_data_clut8bit[(timer div 30) mod maxbit]);
//draw_rectangle(dx, dy, dx - 20, dy + 20, false);
//draw_text(dx, dy - 20, string((timer div 30) mod maxbit))

#endregion
grid_size = 8;
width = 64;
height = 128;
w = 0;
h = 0;
maxbit = 16;
clut = grid_data_clut4bit;
index = (timer div 5) mod maxbit;
//index = 0;
if !((timer) mod (maxbit * 5)){
	count1 += 4;
	
	if (count1 == count2){
		count1++;
	}
	if (count1 >= maxbit){
		count1 = count1 mod maxbit;
		count2 += 4;
		if (count2 == 0){
			count2++;
		}
		if (count2 == count1){
			count2++;
		}
		if (count2 >= maxbit){
			count2 = count2 mod maxbit;
		}
	}
}
if (count1 == 0){
	count1++;
}
bg1 = clut[count1];
bg2 = clut[count2];
for (var i = 0; i < (width * 2) * height; i++){
	color_bg = c_black;
	switch ((h div 4) % grid_size){
		case 0:
		draw_set_colour(clut[(index + 0) mod maxbit]);
		if ((w div 4) % grid_size < 1){
			break;
		}
		
		case 1:
		draw_set_colour(clut[(index + 1) mod maxbit]);
		if ((w div 4) % grid_size <= 1){
			break;
		}
		
		case 2:
		draw_set_colour(clut[(index + 2) mod maxbit]);
		if ((w div 4) % grid_size <= 2){
			break;
		}
		
		case 3:
		draw_set_colour(clut[(index + 3) mod maxbit]);
		if ((w div 4) % grid_size <= 3){
			break;
		}
		
		case 4:
		draw_set_colour(clut[(index + 4) mod maxbit]);
		if ((w div 4) % grid_size <= 4){
			break;
		}
		
		case 5:
		draw_set_colour(clut[(index + 5) mod maxbit]);
		if ((w div 4) % grid_size <= 5){
			break;
		}
		
		case 6:
		draw_set_colour(clut[(index + 6) mod maxbit]);
		if ((w div 4) % grid_size <= 6){
			break;
		}
		
		case 7:
		draw_set_colour(clut[(index + 7) mod maxbit]);
		if ((w div 4) % grid_size <= 7){
			break;
		}
		
		case 8:
		draw_set_colour(clut[(index + 8) mod maxbit]);
		if ((w div 4) % grid_size <= 8){
			break;
		}
				
		default:
		break;
	}
	if ((w div 4) % grid_size < 1){
		draw_set_colour(bg1);
	}
	if ((h div 4) % grid_size < 1){
		draw_set_colour(bg2);
	}
	draw_point(x + w, y + h)
	w++;
	if (w >= width * 2){
		w = 0;
		h++;
	}
}
test = convert_rgb_tim(clut[(timer div 30) mod maxbit], 1);
timer++;
draw_set_colour(clut[(timer div 30) mod maxbit])
draw_text(x + 0, y - 20, string("R:{0}",test.red));
draw_text(x + 40, y - 20, string("G:{0}",test.green));
draw_text(x + 80, y - 20, string("B:{0}",test.blue));
draw_text(x + 140, y - 20, string("STP:{0}",test.stp));

