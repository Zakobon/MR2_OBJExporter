function tim_rectangle_draw(_alpha = 1){
	if (ui_tim_bit_mode != 0){
			draw_set_alpha(.8);
		}
		else{
			draw_set_alpha(.5);
		}
	if (ui_page == 28){
		offset = .55;
	}
	else{
		offset = 1;
	}
	draw_rectangle(grid_x + 256, grid_y + 0,grid_x + 512, grid_y + 512, 0);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text_transformed_colour(grid_x + 376, grid_y + (246 * offset), "4-bit", 1.5, 1.5, 0, c_black, c_black, c_black, c_black, (_alpha * .7));
	draw_text_transformed_colour(grid_x + 120, grid_y + (246 * offset), "4-bit & 8-bit", 1.5, 1.5, 0, c_black, c_black, c_black, c_black, (_alpha * .7));
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	if (ui_page == 28){
		draw_set_alpha(_alpha * 1);
		border = 12;
		draw_set_colour($FF363636);
		draw_rectangle(grid_x + 0, grid_y + 258, grid_x + 511, grid_y + 511, 0);
		draw_set_colour($FF363636);
		draw_rectangle(grid_x + (border / 2) + 0, grid_y + (border / 2) + 256, grid_x - (border / 2) + 511, grid_y - (border / 2) + 511, 0);
		draw_set_colour($FF555555);
		draw_rectangle(grid_x + border + 0,grid_y + border + 256, grid_x - border + 511, grid_y - border + 511, 0);
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_text_transformed_colour(grid_x + 256, grid_y + 406, "Reserved space for opponent", 1.5, 1.5, 0, $FF292929, $FF292929, $FF292929, $FF292929, .7);
		draw_text_transformed_colour(grid_x + 256, grid_y + 366, "Do not put anything down here", 1.5, 1.5, 0, $FF292929, $FF292929, $FF292929, $FF292929, .7);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
	}


	

	draw_set_colour($FFFFFFFF);
	//exit;
	if (ds_list_size(tim_list) == 0){
		exit;
	}

	//Draws tim_list entries as rectangles
	for(var i = 0; i < ds_list_size(tim_list); i ++) {
		bit_size = 1;
		if (tim_list[|i].bit < 1 && bit_size < 2){
			bit_size++;
		}
		timx = tim_list[|i].pixel_x;
		timy = tim_list[|i].pixel_y;
		timw = tim_list[|i].pixel_w;
		timh = tim_list[|i].pixel_h;
	
		if (tim_list[|i].clut_data[0].stp == 1){
			draw_set_alpha(_alpha *.7);
		}
		else{
			draw_set_alpha(_alpha *1);
		}
		//draw next page
		if (ui_tim_view_next_page != 0){
			if (((timx div 64) + 15) == ui_page){
				tx = grid_x + (timx - ((ui_page-16)*64)) * (4 * bit_size);
				ty = grid_y + (timy - 256) * 2;
				
				//draw_set_colour($FF90C183);
				if (bit_size < 2){
					draw_set_colour($FFc4cc9d);
				}
				else{
					draw_set_colour($FF94947A)
				}
				switch(tim_list[|i].clut_y){
					case 505:
					draw_set_colour($ffcfeae4)
					break;
					case 506:
					draw_set_colour($ffb6d3cc)
					break;
					case 507:
					draw_set_colour($ff9dbbb3)
					break;
					case 508:
					draw_set_colour($ff84a39b)
					break;
					case 509:
					draw_set_colour($ff6a8b82)
					break;
					case 510:
					draw_set_colour($ff506962)
					break;
					case 511:
					draw_set_colour($ff354641)
					break;
				}
				draw_set_alpha(_alpha *.3);
				draw_rectangle(tx , ty , tx + (timw * (4 * bit_size)) - 2, ty + (timh * 2) - 2, 0);
				//draw_set_colour($FF960019);
				draw_set_colour($FFFFFFFF);
				draw_rectangle(tx , ty , tx + (timw * (4 * bit_size)) - 2, ty + (timh * 2) - 2, 1);
				draw_set_colour($FF000000);
				if (timw >= 3 && timh >= 5){
				draw_text(tx + 2, ty + 1, string(i));
					if (timw >= (16 / bit_size) && timh >= 20){
						draw_text(tx + 2, ty + 20, string(tim_list[|i].clut_y));
						if (bit_size < 2){
							draw_set_colour($FF960019);
						}
						else{
							draw_set_colour($FF6a1b08);
						}
						draw_text(tx + 24, ty + 1, string(tim_bit_mode_string[tim_list[|i].bit]));
					}
				}
	
			}
		}
		//Draw current page
		if (((timx div 64) + 16) == ui_page){
			tx = grid_x + (timx - ((ui_page-16)*64)) * (4 * bit_size) + 0;
			ty = grid_y + (timy - 256) * 2 + 0;
	
			
			switch(tim_list[|i].clut_y){
				case 505:
				draw_set_colour($ffcfeae4)
				break;
				case 506:
				draw_set_colour($ffb6d3cc)
				break;
				case 507:
				draw_set_colour($ff9dbbb3)
				break;
				case 508:
				draw_set_colour($ff84a39b)
				break;
				case 509:
				draw_set_colour($ff6a8b82)
				break;
				case 510:
				draw_set_colour($ff506962)
				break;
				case 511:
				draw_set_colour($ff354641)
				break;
			}
			draw_set_alpha(_alpha);
			draw_rectangle(tx + 0, ty + 0, tx + (timw * (4 * bit_size)) - 2, ty + (timh * 2) - 2, 0);
			//draw_set_colour($FF960019);
			draw_set_colour($FFFFFFFF);
			//draw_set_colour($FF90C183);
			if (bit_size < 2){
				//draw_set_colour($FFc4cc9d);
				draw_set_colour($FF949494);
			
			}
			else{
				//draw_set_colour($FF94947A);
				draw_set_colour($FF493939);
			}
			draw_set_alpha(1);
			draw_rectangle(tx + 0, ty + 0, tx + (timw * (4 * bit_size)) - 2, ty + (timh * 2) - 2, 1);
			draw_set_colour($FF000000);
			draw_set_alpha(_alpha);
			if (timw >= 3 && timh >= 5){
			draw_text(tx + 2, ty + 1, string(i));
				if (timw >= (16 / bit_size) && timh >= 20){
					draw_text(tx + 2, ty + 20, string(tim_list[|i].clut_y));
					if (bit_size < 2){
						draw_set_colour($FF960019);
					}
					else{
						draw_set_colour($FF6a1b08);
					}
					draw_text(tx + 24, ty + 1, string(tim_bit_mode_string[tim_list[|i].bit]));
				}
			}
	
		}
	
		draw_set_colour($FFCCCCCC);
		draw_set_alpha(_alpha * 1);
	}

	if (ui_tim != -1 && draw_ui_tim != 1){
		bit_size = 1;
		if (tim_list[|ui_tim].bit < 1 && bit_size < 2){
			bit_size++;
		}
		timx = tim_list[|ui_tim].pixel_x;
		timy = tim_list[|ui_tim].pixel_y;
		timw = tim_list[|ui_tim].pixel_w;
		timh = tim_list[|ui_tim].pixel_h;

		tx = grid_x + (timx - ((ui_page-16)*64)) * (4 * bit_size);
		ty = grid_y + (timy - 256) * 2;
	
	

		if (tim_list[|ui_tim].clut_data[0].stp == 1){
			draw_set_alpha(_alpha * .7);
		}
		else{
			draw_set_alpha(_alpha * 1);
		}
	
		draw_set_colour($FFD6C58F);
		draw_rectangle(tx  + 1, ty + 1,  tx + (timw * (4 * bit_size)) - 2, ty + (timh * 2) - 2, 0);
		draw_set_colour($FF111111);
		draw_set_alpha(1);
		draw_rectangle(tx + 1, ty + 1, tx + (timw * (4 * bit_size)) - 2, ty + (timh * 2) - 2, 1);
		draw_set_colour($FF000000);
		draw_set_alpha(_alpha);
		if (timw >= 3 && timh >= 5){
			draw_text(tx + 2, ty + 1, string(ui_tim));
			if (timw >= (16 / bit_size) && timh >= 20){
				draw_text(tx + 2, ty + 20, string(tim_list[|ui_tim].clut_y));
				if (bit_size < 2){
					draw_set_colour($FF960019);				
				}
				else{
					draw_set_colour($FF6a1b08);
				}
				draw_text(tx + 24, ty + 1, string(tim_bit_mode_string[tim_list[|ui_tim].bit]));
			}
		}

	}
	draw_set_alpha(1);
	draw_set_colour($FFFFFFFF);
}