/// @desc Backup B.Step 8/12/26
//if (draw_refresh == 0){
//	exit;
//}

//Variables to keep count of color index per pattern
index_blended = [-1, -1, -1, -1, -1, -1, -1, -1];
index_zigzag = [-1, -1, -1, -1, -1, -1, -1, -1];
index_weave = [-1, -1, -1, -1, -1, -1, -1, -1];
index_tile = [-1, -1, -1, -1, -1, -1, -1, -1];

if (ds_list_size(tim_list) != 0 && draw_refresh != 0){
	draw_refresh = 0;
	if (!surface_exists(vramback)){ //vram page background for transparency visibility
		draw_set_alpha(1);
		vramback = surface_create(256, 256); 

		surface_set_target(vramback);
		draw_sprite(T_Grid, 0, 0, 0);
		
		surface_reset_target();
		view_surface_id[0] = vramback;
	}
	#region Draw TIMs to page surfaces
	for (var a = 0; a < ds_list_size(tim_list); a++){
		tim = tim_list[|a];
		bit_mode = tim.bit;
		switch (bit_mode){
			case 0:
			mult = 4;
			break;
			
			case 1:
			mult = 2;
			break;
		}
		px = tim.pixel_x;
		py = tim.pixel_y - 256;
		pw = tim.pixel_w * mult;
		ph = tim.pixel_h;
		
		#region Sorting into specific page surface arrays
		switch(px div 64){
			case 12:
			switch(bit_mode){
				case 0:
				surf = vram28_4bit;
				draw_check28_4bit = true;
				check = draw_check28_4bit;
				break;
			
				case 1:
				surf = vram28_8bit;
				draw_check28_8bit = true;
				check = draw_check28_8bit;
				break;
			}
			px -= 768;
			break;		
			
			case 13:
			switch(bit_mode){
				case 0:
				surf = vram29_4bit;
				draw_check29_4bit = true;
				check = draw_check29_4bit;
				break;
			
				case 1:
				surf = vram29_8bit;
				draw_check29_8bit = true;
				check = draw_check29_8bit;
				break;
			}
			px -= 832;
			break;		
			
			case 14:
			switch(bit_mode){
				case 0:
				surf = vram30_4bit;
				draw_check30_4bit = true;
				check = draw_check30_4bit;
				break;
			
				case 1:
				surf = vram30_8bit;
				draw_check30_8bit = true;
				check = draw_check30_8bit;
				break;
			}
			px -= 896;
			break;		
			
			case 15:
			switch(bit_mode){
				case 0:
				surf = vram31_4bit;
				draw_check31_4bit = true;
				check = draw_check31_4bit;
				break;
			
				case 1:
				surf = vram31_8bit;
				draw_check31_8bit = true;
				check = draw_check31_8bit;
				break;
			}
			px -= 960;
			break;		
		}
		#endregion
		px *= mult;
		
		for(var b = 0; b < 1; b++){ //cycle through all possible pattern groups
			check[b] = true;
			switch(bit_mode){ 
				case 0:
				c_num = 6; //total colors to cycle through
				i_off = 3; //4-bit clut adjustment for index offset in color cycling
				background = 6;
				grid_clut = grid_data_clut4bit;
				break;
					
				case 1:
				c_num = 12;
				i_off = 3; //8-bit clut adjustment for index offset in color cycling
				background = 14;
				grid_clut = grid_data_clut8bit;
				break;
			}
			
		//	switch(b){ //Grab the number of variant designs a patterns has
		//		case 1:
		//		variant = sprite_get_number(Blended8x8);
		//		break;
							
		//		case 2:
		//		variant = sprite_get_number(ZigZag6x6);
		//		break;
							
		//		case 3:
		//		variant = sprite_get_number(Weave4x4);
		//		break;
							
		//		case 4:
		//		variant = sprite_get_number(Tile4x4);
		//		break;
				
		//		default:
		//		variant = 1;
		//		break;
		//	}
			for (var c = 0; c < 1; c++){
				if !(surface_exists(surf[b][c])){
					surf[b][c] = surface_create(256, 256);
					surface_set_target(surf[b][c]);
					draw_clear_alpha(c_white, true); //empty space filler
				}
				else{
					surface_set_target(surf[b][c]);
				}
				gpu_set_blendenable(false); //try to make alpha values predictable
				
				#region Color indexing
				
				c1 = 0;
				c2 = 0;			
				switch (b){
					case 1:
					index_blended[c] += 1;
					c1 = i_off + index_blended[c];
					c2 = (index_tile[c] div c_num);
					if (c1 == c2){ //prevent duplicate color
						index_blended[c] += 1;
						c1++;
					}
					c2 = c2 mod c_num;
					break;
							
					case 2:
					index_zigzag[c] += 1;
					c1 = i_off + index_blended[c];
					c2 = index_zigzag[c] div c_num;
					if (c1 == c2){
						index_zigzag[c] += 1;
						c1++;
					}
					c2 = c2 mod c_num;
					break;
							
					case 3:
					index_weave[c] += 1;
					c1 = i_off + index_weave[c];
					c2 = index_weave[c] div c_num;
					if (c1 == c2){
						index_weave[c] += 1;
						c1++;
					}
					c2 = c2 mod c_num;
					break;
							
					case 4:
					index_tile[c] += 1;
					c1 = i_off + index_tile[c];
					c2 = index_tile[c] div c_num;
					if (c1 == c2){
						index_tile[c] += 1;
						c1++;
					}
					c2 = c2 mod c_num;
					break;
				
					default:
					break;
				}
					
				//prevent duplicate color pairs from happening
				m_offset = c_num - c2 - 1;//minus 1 for the minimum of 1 when using mod below
				if (m_offset < 0){
					m_offset *= -1;
				}
				c1 = (c2 + (c1 mod (1 + m_offset))) mod c_num;
				#endregion
				
				switch (b){
					case 0:
					grid_flag = false;
					break;
					
					default:
					grid_flag = true;
					break;
				}
				
				pixel_list = pixel_builder(tim_list[|a], grid_flag, c1, c2, background, b - 1, c);
				
				#region Draw pixels to surface
				w = 0;
				h = 0;
				for (var d = 0; d < array_length(pixel_list); d++){
					index = pixel_list[d] >> 1;
					stp = pixel_list[d] & 0b1;
							
					if (w >= pw){
						w = 0;
						h++;
					}
					#region Alpha setup
					if (pixel_list[d] >= 512){ //fully transparent, "erases" pixel
						gpu_set_blendenable(true);
						draw_set_alpha(1);
						draw_set_colour($FFFFFF);
						gpu_set_blendmode(bm_subtract);
								
						draw_point_colour(px + w, py + h, $FFFFFF);
								
						gpu_set_blendmode(bm_normal);
						gpu_set_blendenable(false);
								
						w++;
						continue;
					}
					else if (stp == 1){ //semi-transparent
						draw_set_alpha(png_alpha);
					}
					else { //opaque
						draw_set_alpha(1);
					}
					#endregion
								
					#region Pixel Draw
					if (b == 0){
						draw_clut = tim_rgb_clut[tim_list[|a].clut_y - 505];
						draw_point_colour(px + w, py + h, draw_clut[index + tim_list[|a].clut_x][0]);
					}
					else{
						draw_point_colour(px + w, py + h, grid_clut[index])
					}
					#endregion
							
					w++;			
				}
				surface_reset_target();
				view_surface_id[0] = surf[b][c];
			}
		}
		draw_set_alpha(1);
		gpu_set_blendenable(true);
	}
	#endregion
	#region Draw 8-bit TIMs to VRAM pages
	
	//c_num = 12; //number of individual colors to cycle through
	//	for (var a = 0; a < 5; a++) { 
	//		//[original, blended, zigzag, weave, tile]
	//		if (!surface_exists(vram28_8bit[a][0]) || draw_refresh != 0){
				
	//			for (var b = 0; b < ds_list_size(tim_list); b++){
	//				px = tim_list[|b].pixel_x - 768;
	//				py = tim_list[|b].pixel_y - 256;
	//				pw = tim_list[|b].pixel_w * 2;
	//				ph = tim_list[|b].pixel_h;
					
	//				if (px < 0 || px > 63 || tim_list[|b].bit == 0){
	//					continue;
	//				}
	//				draw_check28_8bit = true;					
	//				PageModeTIM.vram28 = PageModeTIM.vram28 | 0b10;
	//				px = px * 2;
	//				if (a < 1){
	//					grid_flag = false;
	//					pattern = 0;
	//				}
	//				else{
	//					grid_flag = true;
	//					pattern = a - 1;
	//				}
	//				if (a > 0){
	//					switch(pattern){
	//						case 0:
	//						variant = sprite_get_number(Blended8x8);
	//						break;
							
	//						case 1:
	//						variant = sprite_get_number(ZigZag6x6);
	//						break;
							
	//						case 2:
	//						variant = sprite_get_number(Weave4x4);
	//						break;
							
	//						case 3:
	//						variant = sprite_get_number(Tile4x4);
	//						break;
						
	//					}
	//				}
	//				else{
	//					variant = 1;
	//				}
	//				#region Color indexing
	//				c1 = 0;
	//				c2 = 0;
	//				switch (a){
	//					case 1:
	//					index_blended++;
	//					c1 = index_blended;
	//					c2 = (index_blended + 9) div c_num;
	//					if (c1 == c2){ //prevent duplicate color
	//						index_blended++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
							
	//					case 2:
	//					index_zigzag++;
	//					c1 = index_zigzag;
	//					c2 = (index_zigzag + 9) div c_num;
	//					if (c1 == c2){
	//						index_zigzag++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
							
	//					case 3:
	//					index_weave++;
	//					c1 = index_weave;
	//					c2 = (index_weave + 9) div c_num;
	//					if (c1 == c2){
	//						index_weave++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
							
	//					case 4:
	//					index_tile++;
	//					c1 = index_tile;
	//					c2 = (index_tile + 9) div c_num;
	//					if (c1 == c2){
	//						index_tile++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
	//				}
						
	//				//prevent duplicate color pairs from happening
	//				m_offset = c_num - c2 - 1;//minus 1 for the minimum of 1 when using mod below
	//				if (m_offset < 0){
	//					m_offset *= -1;
	//				}
	//				c1 = (c2 + (c1 mod (1 + m_offset))) mod c_num;
	//				#endregion
					
	//				for (var d = 0; d < variant; d++){
	//					w = 0;
	//					h = 0;
	//					background = 14;
						
	//					if (!surface_exists(vram28_8bit[a][d])){
	//						vram28_8bit[a][d] = surface_create(256, 256);
	//						surface_set_target(vram28_8bit[a][d]);
	//						draw_clear_alpha(c_white, true); //empty space filler
	//					}
	//					else{
	//						surface_set_target(vram28_8bit[a][d]);
	//					}
	//					gpu_set_blendenable(false); //try to make alpha values predictable
					
						
					
					
					
	//					pixel_list = pixel_builder(tim_list[|b], grid_flag, c1, c2, background, pattern, d);
	//					for (var c = 0; c < array_length(pixel_list); c++){
	//						index = pixel_list[c] >> 1;
	//						stp = pixel_list[c] & 0b1;
							
	//						if (w >= pw){
	//							w = 0;
	//							h++;
	//						}
	//						#region Alpha setup
	//						if (pixel_list[c] >= 512){ //fully transparent, "erases" pixel
	//							gpu_set_blendenable(true);
	//							draw_set_alpha(1);
	//							draw_set_colour($FFFFFF);
	//							gpu_set_blendmode(bm_subtract);
								
	//							draw_point_colour(px + w, py + h, $FFFFFF);
								
	//							gpu_set_blendmode(bm_normal);
	//							gpu_set_blendenable(false);
								
	//							w++;
	//							continue;
	//						}
	//						else if (stp == 1){ //semi-transparent
	//							draw_set_alpha(png_alpha);
	//						}
	//						else { //opaque
	//							draw_set_alpha(1);
	//						}
	//						#endregion
								
	//						#region Pixel Draw
	//						if (a < 1){
	//							draw_clut = tim_rgb_clut[tim_list[|b].clut_y - 505];
	//							draw_point_colour(px + w, py + h, draw_clut[index][0]);
	//						}
	//						else{
	//							draw_clut = grid_data_clut8bit;
	//							draw_point_colour(px + w, py + h, draw_clut[index])
	//						}
	//						#endregion
							
	//						w++;
								
	//					}
	//					surface_reset_target();
	//					view_surface_id[0] = vram28_8bit[a][d];
	//				}
	//				draw_check28_8bit[b] = true;
	//			}
	//			draw_set_alpha(1);
	//			gpu_set_blendenable(true);
	//		}
	//	}
	//	for (var a = 0; a < 5; a++) { 
	//		//[original, blended, zigzag, weave, tile]
	//		if (!surface_exists(vram29_8bit[a][0]) || draw_refresh != 0){
				
	//			for (var b = 0; b < ds_list_size(tim_list); b++){
	//				px = tim_list[|b].pixel_x - 832;
	//				py = tim_list[|b].pixel_y - 256;
	//				pw = tim_list[|b].pixel_w * 2;
	//				ph = tim_list[|b].pixel_h;
					
	//				if (px < 0 || px > 63 || tim_list[|b].bit == 0){
	//					continue;
	//				}
	//				draw_check29_8bit = true;					
	//				PageModeTIM.vram29 = PageModeTIM.vram29 | 0b10;
	//				px = px * 2;
	//				if (a < 1){
	//					grid_flag = false;
	//					pattern = 0;
	//				}
	//				else{
	//					grid_flag = true;
	//					pattern = a - 1;
	//				}
	//				if (a > 0){
	//					switch(pattern){
	//						case 0:
	//						variant = sprite_get_number(Blended8x8);
	//						break;
							
	//						case 1:
	//						variant = sprite_get_number(ZigZag6x6);
	//						break;
							
	//						case 2:
	//						variant = sprite_get_number(Weave4x4);
	//						break;
							
	//						case 3:
	//						variant = sprite_get_number(Tile4x4);
	//						break;
						
	//					}
	//				}
	//				else{
	//					variant = 1;
	//				}
	//				#region Color indexing
	//				c1 = 0;
	//				c2 = 0;
	//				switch (a){
	//					case 1:
	//					index_blended++;
	//					c1 = index_blended;
	//					c2 = (index_blended + 9) div c_num;
	//					if (c1 == c2){ //prevent duplicate color
	//						index_blended++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
							
	//					case 2:
	//					index_zigzag++;
	//					c1 = index_zigzag;
	//					c2 = (index_zigzag + 9) div c_num;
	//					if (c1 == c2){
	//						index_zigzag++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
							
	//					case 3:
	//					index_weave++;
	//					c1 = index_weave;
	//					c2 = (index_weave + 9) div c_num;
	//					if (c1 == c2){
	//						index_weave++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
							
	//					case 4:
	//					index_tile++;
	//					c1 = index_tile;
	//					c2 = (index_tile + 9) div c_num;
	//					if (c1 == c2){
	//						index_tile++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
	//				}
						
	//				//prevent duplicate color pairs from happening
	//				m_offset = c_num - c2 - 1;//minus 1 for the minimum of 1 when using mod below
	//				if (m_offset < 0){
	//					m_offset *= -1;
	//				}
	//				c1 = (c2 + (c1 mod (1 + m_offset))) mod c_num;
	//				#endregion
					
	//				for (var d = 0; d < variant; d++){
	//					w = 0;
	//					h = 0;
	//					background = 14;
						
	//					if (!surface_exists(vram29_8bit[a][d])){
	//						vram29_8bit[a][d] = surface_create(256, 256);
	//						surface_set_target(vram29_8bit[a][d]);
	//						draw_clear_alpha(c_white, true); //empty space filler
	//					}
	//					else{
	//						surface_set_target(vram29_8bit[a][d]);
	//					}
	//					gpu_set_blendenable(false); //try to make alpha values predictable
					
						
					
					
					
	//					pixel_list = pixel_builder(tim_list[|b], grid_flag, c1, c2, background, pattern, d);
	//					for (var c = 0; c < array_length(pixel_list); c++){
	//						index = pixel_list[c] >> 1;
	//						stp = pixel_list[c] & 0b1;
							
	//						if (w >= pw){
	//							w = 0;
	//							h++;
	//						}
	//						#region Alpha setup
	//						if (pixel_list[c] >= 512){ //fully transparent, "erases" pixel
	//							gpu_set_blendenable(true);
	//							draw_set_alpha(1);
	//							draw_set_colour($FFFFFF);
	//							gpu_set_blendmode(bm_subtract);
								
	//							draw_point_colour(px + w, py + h, $FFFFFF);
								
	//							gpu_set_blendmode(bm_normal);
	//							gpu_set_blendenable(false);
								
	//							w++;
	//							continue;
	//						}
	//						else if (stp == 1){ //semi-transparent
	//							draw_set_alpha(png_alpha);
	//						}
	//						else { //opaque
	//							draw_set_alpha(1);
	//						}
	//						#endregion
								
	//						#region Pixel Draw
	//						if (a < 1){
	//							draw_clut = tim_rgb_clut[tim_list[|b].clut_y - 505];
	//							draw_point_colour(px + w, py + h, draw_clut[index][0]);
	//						}
	//						else{
	//							draw_clut = grid_data_clut8bit;
	//							draw_point_colour(px + w, py + h, draw_clut[index])
	//						}
	//						#endregion
							
	//						w++;
								
	//					}
	//					surface_reset_target();
	//					view_surface_id[0] = vram29_8bit[a][d];
	//				}
	//				draw_check29_8bit[b] = true;
	//			}
	//			draw_set_alpha(1);
	//			gpu_set_blendenable(true);
	//		}
	//	}
	//	for (var a = 0; a < 5; a++) { 
	//		//[original, blended, zigzag, weave, tile]
	//		if (!surface_exists(vram30_8bit[a][0]) || draw_refresh != 0){
				
	//			for (var b = 0; b < ds_list_size(tim_list); b++){
	//				px = tim_list[|b].pixel_x - 896;
	//				py = tim_list[|b].pixel_y - 256;
	//				pw = tim_list[|b].pixel_w * 2;
	//				ph = tim_list[|b].pixel_h;
					
	//				if (px < 0 || px > 63 || tim_list[|b].bit == 0){
	//					continue;
	//				}
	//				draw_check30_8bit = true;					
	//				PageModeTIM.vram30 = PageModeTIM.vram30 | 0b10;
	//				px = px * 2;
	//				if (a < 1){
	//					grid_flag = false;
	//					pattern = 0;
	//				}
	//				else{
	//					grid_flag = true;
	//					pattern = a - 1;
	//				}
	//				if (a > 0){
	//					switch(pattern){
	//						case 0:
	//						variant = sprite_get_number(Blended8x8);
	//						break;
							
	//						case 1:
	//						variant = sprite_get_number(ZigZag6x6);
	//						break;
							
	//						case 2:
	//						variant = sprite_get_number(Weave4x4);
	//						break;
							
	//						case 3:
	//						variant = sprite_get_number(Tile4x4);
	//						break;
						
	//					}
	//				}
	//				else{
	//					variant = 1;
	//				}
	//				#region Color indexing
	//				c1 = 0;
	//				c2 = 0;
	//				switch (a){
	//					case 1:
	//					index_blended++;
	//					c1 = index_blended;
	//					c2 = (index_blended + 9) div c_num;
	//					if (c1 == c2){ //prevent duplicate color
	//						index_blended++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
							
	//					case 2:
	//					index_zigzag++;
	//					c1 = index_zigzag;
	//					c2 = (index_zigzag + 9) div c_num;
	//					if (c1 == c2){
	//						index_zigzag++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
							
	//					case 3:
	//					index_weave++;
	//					c1 = index_weave;
	//					c2 = (index_weave + 9) div c_num;
	//					if (c1 == c2){
	//						index_weave++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
							
	//					case 4:
	//					index_tile++;
	//					c1 = index_tile;
	//					c2 = (index_tile + 9) div c_num;
	//					if (c1 == c2){
	//						index_tile++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
	//				}
						
	//				//prevent duplicate color pairs from happening
	//				m_offset = c_num - c2 - 1;//minus 1 for the minimum of 1 when using mod below
	//				if (m_offset < 0){
	//					m_offset *= -1;
	//				}
	//				c1 = (c2 + (c1 mod (1 + m_offset))) mod c_num;
	//				#endregion
					
	//				for (var d = 0; d < variant; d++){
	//					w = 0;
	//					h = 0;
	//					background = 14;
						
	//					if (!surface_exists(vram30_8bit[a][d])){
	//						vram30_8bit[a][d] = surface_create(256, 256);
	//						surface_set_target(vram30_8bit[a][d]);
	//						draw_clear_alpha(c_white, true); //empty space filler
	//					}
	//					else{
	//						surface_set_target(vram30_8bit[a][d]);
	//					}
	//					gpu_set_blendenable(false); //try to make alpha values predictable
					
						
					
					
					
	//					pixel_list = pixel_builder(tim_list[|b], grid_flag, c1, c2, background, pattern, d);
	//					for (var c = 0; c < array_length(pixel_list); c++){
	//						index = pixel_list[c] >> 1;
	//						stp = pixel_list[c] & 0b1;
							
	//						if (w >= pw){
	//							w = 0;
	//							h++;
	//						}
	//						#region Alpha setup
	//						if (pixel_list[c] >= 512){ //fully transparent, "erases" pixel
	//							gpu_set_blendenable(true);
	//							draw_set_alpha(1);
	//							draw_set_colour($FFFFFF);
	//							gpu_set_blendmode(bm_subtract);
								
	//							draw_point_colour(px + w, py + h, $FFFFFF);
								
	//							gpu_set_blendmode(bm_normal);
	//							gpu_set_blendenable(false);
								
	//							w++;
	//							continue;
	//						}
	//						else if (stp == 1){ //semi-transparent
	//							draw_set_alpha(png_alpha);
	//						}
	//						else { //opaque
	//							draw_set_alpha(1);
	//						}
	//						#endregion
								
	//						#region Pixel Draw
	//						if (a < 1){
	//							draw_clut = tim_rgb_clut[tim_list[|b].clut_y - 505];
	//							draw_point_colour(px + w, py + h, draw_clut[index][0]);
	//						}
	//						else{
	//							draw_clut = grid_data_clut8bit;
	//							draw_point_colour(px + w, py + h, draw_clut[index])
	//						}
	//						#endregion
							
	//						w++;
								
	//					}
	//					surface_reset_target();
	//					view_surface_id[0] = vram30_8bit[a][d];
	//				}
	//				draw_check30_8bit[b] = true;
	//			}
	//			draw_set_alpha(1);
	//			gpu_set_blendenable(true);
	//		}
	//	}
	//	for (var a = 0; a < 5; a++) { 
	//		//[original, blended, zigzag, weave, tile]
	//		if (!surface_exists(vram31_8bit[a][0]) || draw_refresh != 0){
				
	//			for (var b = 0; b < ds_list_size(tim_list); b++){
	//				px = tim_list[|b].pixel_x - 960;
	//				py = tim_list[|b].pixel_y - 256;
	//				pw = tim_list[|b].pixel_w * 2;
	//				ph = tim_list[|b].pixel_h;
					
	//				if (px < 0 || px > 63 || tim_list[|b].bit == 0){
	//					continue;
	//				}
	//				draw_check31_8bit = true;					
	//				PageModeTIM.vram31 = PageModeTIM.vram31 | 0b10;
	//				px = px * 2;
	//				if (a < 1){
	//					grid_flag = false;
	//					pattern = 0;
	//				}
	//				else{
	//					grid_flag = true;
	//					pattern = a - 1;
	//				}
	//				if (a > 0){
	//					switch(pattern){
	//						case 0:
	//						variant = sprite_get_number(Blended8x8);
	//						break;
							
	//						case 1:
	//						variant = sprite_get_number(ZigZag6x6);
	//						break;
							
	//						case 2:
	//						variant = sprite_get_number(Weave4x4);
	//						break;
							
	//						case 3:
	//						variant = sprite_get_number(Tile4x4);
	//						break;
						
	//					}
	//				}
	//				else{
	//					variant = 1;
	//				}
	//				#region Color indexing
	//				c1 = 0;
	//				c2 = 0;
	//				switch (a){
	//					case 1:
	//					index_blended++;
	//					c1 = index_blended;
	//					c2 = (index_blended + 9) div c_num;
	//					if (c1 == c2){ //prevent duplicate color
	//						index_blended++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
							
	//					case 2:
	//					index_zigzag++;
	//					c1 = index_zigzag;
	//					c2 = (index_zigzag + 9) div c_num;
	//					if (c1 == c2){
	//						index_zigzag++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
							
	//					case 3:
	//					index_weave++;
	//					c1 = index_weave;
	//					c2 = (index_weave + 9) div c_num;
	//					if (c1 == c2){
	//						index_weave++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
							
	//					case 4:
	//					index_tile++;
	//					c1 = index_tile;
	//					c2 = (index_tile + 9) div c_num;
	//					if (c1 == c2){
	//						index_tile++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
	//				}
						
	//				//prevent duplicate color pairs from happening
	//				m_offset = c_num - c2 - 1;//minus 1 for the minimum of 1 when using mod below
	//				if (m_offset < 0){
	//					m_offset *= -1;
	//				}
	//				c1 = (c2 + (c1 mod (1 + m_offset))) mod c_num;
	//				#endregion
					
	//				for (var d = 0; d < variant; d++){
	//					w = 0;
	//					h = 0;
	//					background = 14;
						
	//					if (!surface_exists(vram31_8bit[a][d])){
	//						vram31_8bit[a][d] = surface_create(256, 256);
	//						surface_set_target(vram31_8bit[a][d]);
	//						draw_clear_alpha(c_white, true); //empty space filler
	//					}
	//					else{
	//						surface_set_target(vram31_8bit[a][d]);
	//					}
	//					gpu_set_blendenable(false); //try to make alpha values predictable
					
						
					
					
					
	//					pixel_list = pixel_builder(tim_list[|b], grid_flag, c1, c2, background, pattern, d);
	//					for (var c = 0; c < array_length(pixel_list); c++){
	//						index = pixel_list[c] >> 1;
	//						stp = pixel_list[c] & 0b1;
							
	//						if (w >= pw){
	//							w = 0;
	//							h++;
	//						}
	//						#region Alpha setup
	//						if (pixel_list[c] >= 512){ //fully transparent, "erases" pixel
	//							gpu_set_blendenable(true);
	//							draw_set_alpha(1);
	//							draw_set_colour($FFFFFF);
	//							gpu_set_blendmode(bm_subtract);
								
	//							draw_point_colour(px + w, py + h, $FFFFFF);
								
	//							gpu_set_blendmode(bm_normal);
	//							gpu_set_blendenable(false);
								
	//							w++;
	//							continue;
	//						}
	//						else if (stp == 1){ //semi-transparent
	//							draw_set_alpha(png_alpha);
	//						}
	//						else { //opaque
	//							draw_set_alpha(1);
	//						}
	//						#endregion
								
	//						#region Pixel Draw
	//						if (a < 1){
	//							draw_clut = tim_rgb_clut[tim_list[|b].clut_y - 505];
	//							draw_point_colour(px + w, py + h, draw_clut[index][0]);
	//						}
	//						else{
	//							draw_clut = grid_data_clut8bit;
	//							draw_point_colour(px + w, py + h, draw_clut[index])
	//						}
	//						#endregion
							
	//						w++;
								
	//					}
	//					surface_reset_target();
	//					view_surface_id[0] = vram31_8bit[a][d];
	//				}
	//				draw_check31_8bit[b] = true;
	//			}
	//			draw_set_alpha(1);
	//			gpu_set_blendenable(true);
	//		}
	//	}
	#endregion
	#region Draw 4-bit TIMs to VRAM pages
	//c_num = 6;  //number of individual colors to cycle through
	//	for (var a = 0; a < 5; a++) { 
	//		//[original, blended, zigzag, weave, tile]
	//		if (!surface_exists(vram28_4bit[a][0]) || draw_refresh != 0){
				
	//			for (var b = 0; b < ds_list_size(tim_list); b++){
	//				px = tim_list[|b].pixel_x - 768;
	//				py = tim_list[|b].pixel_y - 256;
	//				pw = tim_list[|b].pixel_w * 4;
	//				ph = tim_list[|b].pixel_h;
					
	//				if (px < 0 || px > 63 || tim_list[|b].bit == 1){
	//					continue;
	//				}
	//				draw_check28_4bit = true;					
	//				PageModeTIM.vram28 = PageModeTIM.vram28 | 0b10;
	//				px = px * 4;
	//				if (a < 1){
	//					grid_flag = false;
	//					pattern = 0;
	//				}
	//				else{
	//					grid_flag = true;
	//					pattern = a - 1;
	//				}
	//				if (a > 0){
	//					switch(pattern){
	//						case 0:
	//						variant = sprite_get_number(Blended8x8);
	//						break;
							
	//						case 1:
	//						variant = sprite_get_number(ZigZag6x6);
	//						break;
							
	//						case 2:
	//						variant = sprite_get_number(Weave4x4);
	//						break;
							
	//						case 3:
	//						variant = sprite_get_number(Tile4x4);
	//						break;
						
	//					}
	//				}
	//				else{
	//					variant = 1;
	//				}
	//				#region Color indexing
	//				c1 = 0;
	//				c2 = 0;
	//				switch (a){
	//					case 1:
	//					index_blended++;
	//					c1 = index_blended;
	//					c2 = (index_blended + 3) div c_num;
	//					if (c1 == c2){ //prevent duplicate color
	//						index_blended++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
							
	//					case 2:
	//					index_zigzag++;
	//					c1 = index_zigzag;
	//					c2 = (index_zigzag + 3) div c_num;
	//					if (c1 == c2){
	//						index_zigzag++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
							
	//					case 3:
	//					index_weave++;
	//					c1 = index_weave;
	//					c2 = (index_weave + 3) div c_num;
	//					if (c1 == c2){
	//						index_weave++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
							
	//					case 4:
	//					index_tile++;
	//					c1 = index_tile;
	//					c2 = (index_tile + 3) div c_num;
	//					if (c1 == c2){
	//						index_tile++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
	//				}
						
	//				//prevent duplicate color pairs from happening
	//				m_offset = c_num - c2 - 1;//minus 1 for the minimum of 1 when using mod below
	//				if (m_offset < 0){
	//					m_offset *= -1;
	//				}
	//				c1 = (c2 + (c1 mod (1 + m_offset))) mod c_num;
	//				#endregion
					
	//				for (var d = 0; d < variant; d++){
	//					w = 0;
	//					h = 0;
	//					background = 6;
						
	//					if (!surface_exists(vram28_4bit[a][d])){
	//						vram28_4bit[a][d] = surface_create(256, 256);
	//						surface_set_target(vram28_4bit[a][d]);
	//						draw_clear_alpha(c_white, true); //empty space filler
	//					}
	//					else{
	//						surface_set_target(vram28_4bit[a][d]);
	//					}
	//					gpu_set_blendenable(false); //try to make alpha values predictable
					
						
					
					
					
	//					pixel_list = pixel_builder(tim_list[|b], grid_flag, c1, c2, background, pattern, d);
	//					for (var c = 0; c < array_length(pixel_list); c++){
	//						index = pixel_list[c] >> 1;
	//						stp = pixel_list[c] & 0b1;
							
	//						if (w >= pw){
	//							w = 0;
	//							h++;
	//						}
	//						#region Alpha setup
	//						if (pixel_list[c] >= 512){ //fully transparent, "erases" pixel
	//							gpu_set_blendenable(true);
	//							draw_set_alpha(1);
	//							draw_set_colour($FFFFFF);
	//							gpu_set_blendmode(bm_subtract);
								
	//							draw_point_colour(px + w, py + h, $FFFFFF);
								
	//							gpu_set_blendmode(bm_normal);
	//							gpu_set_blendenable(false);
								
	//							w++;
	//							continue;
	//						}
	//						else if (stp == 1){ //semi-transparent
	//							draw_set_alpha(png_alpha);
	//						}
	//						else { //opaque
	//							draw_set_alpha(1);
	//						}
	//						#endregion
								
	//						#region Pixel Draw
	//						if (a < 1){
	//							draw_clut = tim_rgb_clut[tim_list[|b].clut_y - 505];
	//							draw_point_colour(px + w, py + h, draw_clut[index + tim_list[|b].clut_x][0]);
	//						}
	//						else{
	//							draw_clut = grid_data_clut4bit;
	//							draw_point_colour(px + w, py + h, draw_clut[index])
	//						}
	//						#endregion
							
	//						w++;
								
	//					}
	//					surface_reset_target();
	//					view_surface_id[0] = vram28_4bit[a][d];
	//				}
	//				draw_check28_4bit[b] = true;
	//			}
	//			draw_set_alpha(1);
	//			gpu_set_blendenable(true);
	//		}
	//	}
	//	for (var a = 0; a < 5; a++) { 
	//		//[original, blended, zigzag, weave, tile]
	//		if (!surface_exists(vram29_4bit[a][0]) || draw_refresh != 0){
				
	//			for (var b = 0; b < ds_list_size(tim_list); b++){
	//				px = tim_list[|b].pixel_x - 832;
	//				py = tim_list[|b].pixel_y - 256;
	//				pw = tim_list[|b].pixel_w * 4;
	//				ph = tim_list[|b].pixel_h;
					
	//				if (px < 0 || px > 63 || tim_list[|b].bit == 1){
	//					continue;
	//				}
	//				draw_check29_4bit = true;					
	//				PageModeTIM.vram29 = PageModeTIM.vram29 | 0b10;
	//				px = px * 4;
	//				if (a < 1){
	//					grid_flag = false;
	//					pattern = 0;
	//				}
	//				else{
	//					grid_flag = true;
	//					pattern = a - 1;
	//				}
	//				if (a > 0){
	//					switch(pattern){
	//						case 0:
	//						variant = sprite_get_number(Blended8x8);
	//						break;
							
	//						case 1:
	//						variant = sprite_get_number(ZigZag6x6);
	//						break;
							
	//						case 2:
	//						variant = sprite_get_number(Weave4x4);
	//						break;
							
	//						case 3:
	//						variant = sprite_get_number(Tile4x4);
	//						break;
						
	//					}
	//				}
	//				else{
	//					variant = 1;
	//				}
	//				#region Color indexing
	//				c1 = 0;
	//				c2 = 0;
	//				switch (a){
	//					case 1:
	//					index_blended++;
	//					c1 = index_blended;
	//					c2 = (index_blended + 3) div c_num;
	//					if (c1 == c2){ //prevent duplicate color
	//						index_blended++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
							
	//					case 2:
	//					index_zigzag++;
	//					c1 = index_zigzag;
	//					c2 = (index_zigzag + 3) div c_num;
	//					if (c1 == c2){
	//						index_zigzag++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
							
	//					case 3:
	//					index_weave++;
	//					c1 = index_weave;
	//					c2 = (index_weave + 3) div c_num;
	//					if (c1 == c2){
	//						index_weave++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
							
	//					case 4:
	//					index_tile++;
	//					c1 = index_tile;
	//					c2 = (index_tile + 3) div c_num;
	//					if (c1 == c2){
	//						index_tile++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
	//				}
						
	//				//prevent duplicate color pairs from happening
	//				m_offset = c_num - c2 - 1;//minus 1 for the minimum of 1 when using mod below
	//				if (m_offset < 0){
	//					m_offset *= -1;
	//				}
	//				c1 = (c2 + (c1 mod (1 + m_offset))) mod c_num;
	//				#endregion
					
	//				for (var d = 0; d < variant; d++){
	//					w = 0;
	//					h = 0;
	//					background = 6;
						
	//					if (!surface_exists(vram29_4bit[a][d])){
	//						vram29_4bit[a][d] = surface_create(256, 256);
	//						surface_set_target(vram29_4bit[a][d]);
	//						draw_clear_alpha(c_white, true); //empty space filler
	//					}
	//					else{
	//						surface_set_target(vram29_4bit[a][d]);
	//					}
	//					gpu_set_blendenable(false); //try to make alpha values predictable
					
						
					
					
					
	//					pixel_list = pixel_builder(tim_list[|b], grid_flag, c1, c2, background, pattern, d);
	//					for (var c = 0; c < array_length(pixel_list); c++){
	//						index = pixel_list[c] >> 1;
	//						stp = pixel_list[c] & 0b1;
							
	//						if (w >= pw){
	//							w = 0;
	//							h++;
	//						}
	//						#region Alpha setup
	//						if (pixel_list[c] >= 512){ //fully transparent, "erases" pixel
	//							gpu_set_blendenable(true);
	//							draw_set_alpha(1);
	//							draw_set_colour($FFFFFF);
	//							gpu_set_blendmode(bm_subtract);
								
	//							draw_point_colour(px + w, py + h, $FFFFFF);
								
	//							gpu_set_blendmode(bm_normal);
	//							gpu_set_blendenable(false);
								
	//							w++;
	//							continue;
	//						}
	//						else if (stp == 1){ //semi-transparent
	//							draw_set_alpha(png_alpha);
	//						}
	//						else { //opaque
	//							draw_set_alpha(1);
	//						}
	//						#endregion
								
	//						#region Pixel Draw
	//						if (a < 1){
	//							draw_clut = tim_rgb_clut[tim_list[|b].clut_y - 505];
	//							draw_point_colour(px + w, py + h, draw_clut[index + tim_list[|b].clut_x][0]);
	//						}
	//						else{
	//							draw_clut = grid_data_clut4bit;
	//							draw_point_colour(px + w, py + h, draw_clut[index])
	//						}
	//						#endregion
							
	//						w++;
								
	//					}
	//					surface_reset_target();
	//					view_surface_id[0] = vram29_4bit[a][d];
	//				}
	//				draw_check29_4bit[b] = true;
	//			}
	//			draw_set_alpha(1);
	//			gpu_set_blendenable(true);
	//		}
	//	}
	//	for (var a = 0; a < 5; a++) { 
	//		//[original, blended, zigzag, weave, tile]
	//		if (!surface_exists(vram30_4bit[a][0]) || draw_refresh != 0){
				
	//			for (var b = 0; b < ds_list_size(tim_list); b++){
	//				px = tim_list[|b].pixel_x - 896;
	//				py = tim_list[|b].pixel_y - 256;
	//				pw = tim_list[|b].pixel_w * 4;
	//				ph = tim_list[|b].pixel_h;
					
	//				if (px < 0 || px > 63 || tim_list[|b].bit == 1){
	//					continue;
	//				}
	//				draw_check30_4bit = true;					
	//				PageModeTIM.vram30 = PageModeTIM.vram30 | 0b10;
	//				px = px * 4;
	//				if (a < 1){
	//					grid_flag = false;
	//					pattern = 0;
	//				}
	//				else{
	//					grid_flag = true;
	//					pattern = a - 1;
	//				}
	//				if (a > 0){
	//					switch(pattern){
	//						case 0:
	//						variant = sprite_get_number(Blended8x8);
	//						break;
							
	//						case 1:
	//						variant = sprite_get_number(ZigZag6x6);
	//						break;
							
	//						case 2:
	//						variant = sprite_get_number(Weave4x4);
	//						break;
							
	//						case 3:
	//						variant = sprite_get_number(Tile4x4);
	//						break;
						
	//					}
	//				}
	//				else{
	//					variant = 1;
	//				}
	//				#region Color indexing
	//				c1 = 0;
	//				c2 = 0;
	//				switch (a){
	//					case 1:
	//					index_blended++;
	//					c1 = index_blended;
	//					c2 = (index_blended + 3) div c_num;
	//					if (c1 == c2){ //prevent duplicate color
	//						index_blended++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
							
	//					case 2:
	//					index_zigzag++;
	//					c1 = index_zigzag;
	//					c2 = (index_zigzag + 3) div c_num;
	//					if (c1 == c2){
	//						index_zigzag++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
							
	//					case 3:
	//					index_weave++;
	//					c1 = index_weave;
	//					c2 = (index_weave + 3) div c_num;
	//					if (c1 == c2){
	//						index_weave++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
							
	//					case 4:
	//					index_tile++;
	//					c1 = index_tile;
	//					c2 = (index_tile + 3) div c_num;
	//					if (c1 == c2){
	//						index_tile++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
	//				}
						
	//				//prevent duplicate color pairs from happening
	//				m_offset = c_num - c2 - 1;//minus 1 for the minimum of 1 when using mod below
	//				if (m_offset < 0){
	//					m_offset *= -1;
	//				}
	//				c1 = (c2 + (c1 mod (1 + m_offset))) mod c_num;
	//				#endregion
					
	//				for (var d = 0; d < variant; d++){
	//					w = 0;
	//					h = 0;
	//					background = 6;
						
	//					if (!surface_exists(vram30_4bit[a][d])){
	//						vram30_4bit[a][d] = surface_create(256, 256);
	//						surface_set_target(vram30_4bit[a][d]);
	//						draw_clear_alpha(c_white, true); //empty space filler
	//					}
	//					else{
	//						surface_set_target(vram30_4bit[a][d]);
	//					}
	//					gpu_set_blendenable(false); //try to make alpha values predictable
					
						
					
					
					
	//					pixel_list = pixel_builder(tim_list[|b], grid_flag, c1, c2, background, pattern, d);
	//					for (var c = 0; c < array_length(pixel_list); c++){
	//						index = pixel_list[c] >> 1;
	//						stp = pixel_list[c] & 0b1;
							
	//						if (w >= pw){
	//							w = 0;
	//							h++;
	//						}
	//						#region Alpha setup
	//						if (pixel_list[c] >= 512){ //fully transparent, "erases" pixel
	//							gpu_set_blendenable(true);
	//							draw_set_alpha(1);
	//							draw_set_colour($FFFFFF);
	//							gpu_set_blendmode(bm_subtract);
								
	//							draw_point_colour(px + w, py + h, $FFFFFF);
								
	//							gpu_set_blendmode(bm_normal);
	//							gpu_set_blendenable(false);
								
	//							w++;
	//							continue;
	//						}
	//						else if (stp == 1){ //semi-transparent
	//							draw_set_alpha(png_alpha);
	//						}
	//						else { //opaque
	//							draw_set_alpha(1);
	//						}
	//						#endregion
								
	//						#region Pixel Draw
	//						if (a < 1){
	//							draw_clut = tim_rgb_clut[tim_list[|b].clut_y - 505];
	//							draw_point_colour(px + w, py + h, draw_clut[index + tim_list[|b].clut_x][0]);
	//						}
	//						else{
	//							draw_clut = grid_data_clut4bit;
	//							draw_point_colour(px + w, py + h, draw_clut[index])
	//						}
	//						#endregion
							
	//						w++;
								
	//					}
	//					surface_reset_target();
	//					view_surface_id[0] = vram30_4bit[a][d];
	//				}
	//				draw_check30_4bit[b] = true;
	//			}
	//			draw_set_alpha(1);
	//			gpu_set_blendenable(true);
	//		}
	//	}
	//	for (var a = 0; a < 5; a++) { 
	//		//[original, blended, zigzag, weave, tile]
	//		if (!surface_exists(vram31_4bit[a][0]) || draw_refresh != 0){
				
	//			for (var b = 0; b < ds_list_size(tim_list); b++){
	//				px = tim_list[|b].pixel_x - 960;
	//				py = tim_list[|b].pixel_y - 256;
	//				pw = tim_list[|b].pixel_w * 4;
	//				ph = tim_list[|b].pixel_h;
					
	//				if (px < 0 || px > 63 || tim_list[|b].bit == 1){
	//					continue;
	//				}
	//				draw_check31_4bit = true;					
	//				PageModeTIM.vram31 = PageModeTIM.vram31 | 0b10;
	//				px = px * 4;
	//				if (a < 1){
	//					grid_flag = false;
	//					pattern = 0;
	//				}
	//				else{
	//					grid_flag = true;
	//					pattern = a - 1;
	//				}
	//				if (a > 0){
	//					switch(pattern){
	//						case 0:
	//						variant = sprite_get_number(Blended8x8);
	//						break;
							
	//						case 1:
	//						variant = sprite_get_number(ZigZag6x6);
	//						break;
							
	//						case 2:
	//						variant = sprite_get_number(Weave4x4);
	//						break;
							
	//						case 3:
	//						variant = sprite_get_number(Tile4x4);
	//						break;
						
	//					}
	//				}
	//				else{
	//					variant = 1;
	//				}
	//				#region Color indexing
	//				c1 = 0;
	//				c2 = 0;
	//				switch (a){
	//					case 1:
	//					index_blended++;
	//					c1 = index_blended;
	//					c2 = (index_blended + 3) div c_num;
	//					if (c1 == c2){ //prevent duplicate color
	//						index_blended++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
							
	//					case 2:
	//					index_zigzag++;
	//					c1 = index_zigzag;
	//					c2 = (index_zigzag + 3) div c_num;
	//					if (c1 == c2){
	//						index_zigzag++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
							
	//					case 3:
	//					index_weave++;
	//					c1 = index_weave;
	//					c2 = (index_weave + 3) div c_num;
	//					if (c1 == c2){
	//						index_weave++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
							
	//					case 4:
	//					index_tile++;
	//					c1 = index_tile;
	//					c2 = (index_tile + 3) div c_num;
	//					if (c1 == c2){
	//						index_tile++;
	//						c1++;
	//					}
	//					c2 = c2 mod c_num;
	//					break;
	//				}
						
	//				//prevent duplicate color pairs from happening
	//				m_offset = c_num - c2 - 1;//minus 1 for the minimum of 1 when using mod below
	//				if (m_offset < 0){
	//					m_offset *= -1;
	//				}
	//				c1 = (c2 + (c1 mod (1 + m_offset))) mod c_num;
	//				#endregion
					
	//				for (var d = 0; d < variant; d++){
	//					w = 0;
	//					h = 0;
	//					background = 6;
						
	//					if (!surface_exists(vram31_4bit[a][d])){
	//						vram31_4bit[a][d] = surface_create(256, 256);
	//						surface_set_target(vram31_4bit[a][d]);
	//						draw_clear_alpha(c_white, true); //empty space filler
	//					}
	//					else{
	//						surface_set_target(vram31_4bit[a][d]);
	//					}
	//					gpu_set_blendenable(false); //try to make alpha values predictable
					
						
					
					
					
	//					pixel_list = pixel_builder(tim_list[|b], grid_flag, c1, c2, background, pattern, d);
	//					for (var c = 0; c < array_length(pixel_list); c++){
	//						index = pixel_list[c] >> 1;
	//						stp = pixel_list[c] & 0b1;
							
	//						if (w >= pw){
	//							w = 0;
	//							h++;
	//						}
	//						#region Alpha setup
	//						if (pixel_list[c] >= 512){ //fully transparent, "erases" pixel
	//							gpu_set_blendenable(true);
	//							draw_set_alpha(1);
	//							draw_set_colour($FFFFFF);
	//							gpu_set_blendmode(bm_subtract);
								
	//							draw_point_colour(px + w, py + h, $FFFFFF);
								
	//							gpu_set_blendmode(bm_normal);
	//							gpu_set_blendenable(false);
								
	//							w++;
	//							continue;
	//						}
	//						else if (stp == 1){ //semi-transparent
	//							draw_set_alpha(png_alpha);
	//						}
	//						else { //opaque
	//							draw_set_alpha(1);
	//						}
	//						#endregion
								
	//						#region Pixel Draw
	//						if (a < 1){
	//							draw_clut = tim_rgb_clut[tim_list[|b].clut_y - 505];
	//							draw_point_colour(px + w, py + h, draw_clut[index + tim_list[|b].clut_x][0]);
	//						}
	//						else{
	//							draw_clut = grid_data_clut4bit;
	//							draw_point_colour(px + w, py + h, draw_clut[index])
	//						}
	//						#endregion
							
	//						w++;
								
	//					}
	//					surface_reset_target();
	//					view_surface_id[0] = vram31_4bit[a][d];
	//				}
	//				draw_check31_4bit[b] = true;
	//			}
	//			draw_set_alpha(1);
	//			gpu_set_blendenable(true);
	//		}
	//	}
	#endregion
}
timer++;
if (timer > 30){
	timer = 0;
}