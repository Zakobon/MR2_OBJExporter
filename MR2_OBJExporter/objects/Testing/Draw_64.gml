if (string_length(keyboard_string) > 9){
	keyboard_string = test_string;
}
else if(keyboard_lastkey == vk_backspace){
	test_string = keyboard_string;
}
else{
	switch(keyboard_lastchar){
		case "0":
		case "1":
		case "2":
		case "3":
		case "4":
		case "5":
		case "6":
		case "7":
		case "8":
		case "9":
		test_string = keyboard_string;
		break;
	
		default:
		if (keyboard_key != 0){
			keyboard_string = test_string;
		}
		break;
	}
}
while (string_length(test_string) < 3){
	test_string = string_insert("0",test_string,1);
}
col_cycle = [c_red, c_red, c_maroon , c_maroon]

draw_text_ext_colour(200, 200, keyboard_string, 5, 300, col_cycle[2], col_cycle[0], col_cycle[0], col_cycle[2], 1);
ind = (timer) div 4;
draw_text_ext_colour(200, 250, test_string, 5, 300, col_cycle[ind mod 4], col_cycle[(ind + 1) mod 4], col_cycle[(ind + 2) mod 4], col_cycle[(ind + 3) mod 4], 1);
timer++;
exit;
//draw_text(x, y, string(sprite));
//draw_sprite(sprite, 0, x, y + 24)
var test_button_active = variable_instance_get(test_button, "active");
#region Grid CLUT indexing for color pairs

if (build){
	build = false;
	//enum color 
	//{
	//	cap = 15,
	//	c1_max = color.cap - 1,
	//	c2_max = color.cap - 2
	//}
	//a = 0;
	//c_array = [[],[]];//[0b1111 + (0b1111 << 4)]
	//off = (1 + a) div color.cap;
	//c2 = off mod (color.cap - off);
	//c1 = 1 + c2 + (a mod (color.cap - c2 - 1));
	
	//off = 0;
	//index = 0;
	//var cap = 0;
	//for (var i = 0; i < 2; ++i){
	//	flag = true;
	//	switch(i){
	//		case 0:
	//		cap = 7;
	//		break;
			
	//		case 1:
	//		cap = 255;
	//		break;		
	//	}
	//	var c2 = 0;
	//	var c1 = 1;
	//	var c1_max = cap - 1;
	//	var c2_max = cap - 2;
	//	while (flag == true){
	//		if (c2 == c2_max && c1 == c1_max){
	//			flag = false;
	//		}
	//		else{
	//			c1++;
	//			if !(c1 mod cap){
	//				c2++;
	//				c1 = c2 + 1;
	//			}
	//			index = (c2 << 4) | c1;
	//			array_push(c_array[i], index);
	//		}
	//	}
	//	test = 0;
	//}
	//a = 0;
	new_array = c_index_builder(7,12);
	snum_4bit = array_length(new_array[0]);
	snum_8bit = array_length(new_array[1]);
	index1 = 15;
	index2 = 15;
	index0 = 15;
	//variable_instance_set(test_button, "display", string("|4bit:{0}|8bit:{1}|", array_length(new_array[0]), array_length(new_array[1])));
	px = 0;
	py = 0;
	pw = 24;
	ph = 32;
	mult = 2;
	
	variable_instance_set(test_button, "display", string(count1));
}



#endregion


if (test_button_active == 1){
	variable_instance_set(test_button, "active", 0);
	//sprite_builder_pattern(Weave256x256, tim_list);
	
	//variable_instance_set(test_button, "display", string("|index2:{0}|index1:{1}|", index2, index1));
	count1++;
	variable_instance_set(test_button, "display", string("a:{0}", count1 mod ds_list_size(tim_list)));
	pix_array = [];
	//for (var a = 0; a < ds_list_size(tim_list); a++){
	build = true;
}

if (build == true && ds_list_size(tim_list) != 0){
	build = false;
	off_x = 0;
	off_y = 32;
	pix_array = get_pdata(tim_list[|count1], tex_grid[1][0])
	
	on = true;
}
if (on == true){
	dw = 0;
	dh = 0;
	tw = tim_list[|count1].pixel_w;
	th = tim_list[|count1].pixel_h;
	switch (tim_list[|count1].bit){
		case 0:
		mult = 4;
		clut = grid_data_clut4bit;
		break;
		
		case 1:
		mult = 2;
		clut = grid_data_clut8bit;
		break;
	}
	for (var b = 0; b < th * (tw * mult); b++){
		if (dw >= (tw * mult)){
			dw = 0;
			dh++;
		}
		draw_set_color(clut[pix_array[b]]);
		draw_point(x + dw + off_x, y + dh + off_y);
		dw++;
	}
}
exit;
for (var b = 0; b < 2; b++){
	ind_off = b * 3;
	index1 = new_array[1][(count1 + b) mod snum_8bit] & 0b1111;
	index2 = new_array[1][(count1 + b) mod snum_8bit] >> 4;
	draw_sprite_part_ext(Weave256x256, ind_off + 0, 0, 0, pw, ph, x + (px * mult) + (pw * mult * b), y + ph, 1, 1, grid_data_clut8bit[index0], 1);
	draw_sprite_part_ext(Weave256x256, ind_off + 1, 0, 0, pw, ph, x + (px * mult) + (pw * mult * b), y + ph, 1, 1, grid_data_clut8bit[index1], 1);
	draw_sprite_part_ext(Weave256x256, ind_off + 2, 0, 0, pw, ph, x + (px * mult) + (pw * mult * b), y + ph, 1, 1, grid_data_clut8bit[index2], 1);
	switch(b){
		case 0:
		draw_set_colour(grid_data_clut8bit[index1]);
		break;
		
		case 1:
		draw_set_colour(grid_data_clut8bit[index2]);
		break;
	}
	dx = x + (px * mult) + (pw * mult * b);
	dy = y + ph;
	draw_rectangle(dx, dy, dx + pw , dy + (ph / 2), false);
}

#region Mouse xy hover testing [disabled]

if(false){
	mx = mouse_x > p28_Window.left && mouse_x < p31_Window.left + p31_Window.width;
	my = mouse_y > p28_Window.top && mouse_y < p31_Window.top + p31_Window.height;
	if (mx && my){
		draw_set_colour(c_red);
	}
	else{
		draw_set_colour(c_white);
	}
	test = draw_getpixel(mouse_x, mouse_y);
	test_2 = draw_getpixel_ext(mouse_x, mouse_y);
	r = test & 0b1111_1111 ;
	g = (test >> 8) & 0b1111_1111 ;
	b = (test >> 16) & 0b1111_1111 ;
	a = (test_2 >> 24) & 0b1111_1111 ;

	draw_text(mouse_x, mouse_y + 20, string("r: {0} g: {1} b: {2} a: {3}", r,g,b,a));
	draw_text(mouse_x, mouse_y + 40, string("mouse_x in bounds:{0}", mx));
	var h = 0;
	var w = 0;
	var scale = 8;
	draw_set_colour(c_white);
}
#endregion

#region Color inversion tests [disabled]

if(false){
	dx = mouse_x;
	dy = mouse_y;
	//draw_set_colour(grid_data_clut8bit[(timer div 30) mod maxbit]);
	draw_rectangle(dx, dy, dx - 20, dy + 20, false);
	draw_text(dx, dy - 20, string((timer div 30) mod maxbit))
}
#endregion

exit;
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
