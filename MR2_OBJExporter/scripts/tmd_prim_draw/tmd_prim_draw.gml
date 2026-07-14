//draws each primitive in _prim_array[i + _offset]with _line color and a _line color
//_base_offset is added to _prim_array[i + _offset]'s index
//_prim_array[i + _offset][_base_offset + i].tex

function tmd_prim_draw(_prim_array, _offset, _count, _line, _fill, _vertex_color = 0, _transparency = 1){
	prim_array = [];
	vert_size = 2;
	prim = [];
	//gpu_set_blendequation_sepalpha(bm_eq_add, bm_eq_add);
	//gpu_set_blendmode_ext_sepalpha(bm_inv_dest_color, bm_inv_src_color, bm_one, bm_one);
	//gpu_set_blendmode_ext(bm_inv_dest_color, bm_inv_src_colour);
	if(is_array(_prim_array)){
		prim_array = _prim_array;
	}
	else{
		prim_array = [_prim_array];
	}
	coord_minmax(_prim_array);
	for (var i = 0; i < _count; i++){
		
		draw_set_alpha(_transparency);
		
		page = prim_array[i + _offset].page_x;
		bit = prim_array[i + _offset].c_mode;
		

		switch(page + 16){
			case 28:
			if ((PageModeTIM.vram28 >> 1) != bit){
				continue;
			}
			break;
					
			case 29:
			if ((PageModeTIM.vram29 >> 1) != bit){
				continue;
			}
			break;
					
			case 30:
			if ((PageModeTIM.vram30 >> 1) != bit){
				continue;
			}
			break;
					
			case 31:
			if ((PageModeTIM.vram31 >> 1) != bit){
				continue;
			}
			break;
		}
		x_list = [];
		y_list = [];
		page_list = [];
		for (var b = 0; b < array_length(prim_array[i + _offset].tex_x); b++){
			
			x_base = (prim_array[i + _offset].tex_x[b]);
			y_base = (prim_array[i + _offset].tex_y[b]);
			
			array_push(x_list, x_base);
			array_push(y_list, y_base);
			array_push(page_list, page);
		}
			
		//c_list = [_line, _line, _line, _line];
		#region Transparency modes test [disabled]
		//switch ((prim_array[i + _offset].cmd >> 1) & 0b1){
		//	case 0:
		//	transparency = _transparency;
		//	break;
		//	case 1:
		//	switch (prim_array[i + _offset].t_mode){
		//		case 0: //Back50% + Front50%
		//		transparency = _transparency * .5;
		//		break;
		//		case 1: //Back100% + Front100%
		//		transparency = _transparency * .7;
		//		c_list = [_line * 1.2, _line * 1.2, _line * 1.2, _line * 1.2];
		//		break;
		//		case 2: //Back100% - Front100%
		//		transparency = _transparency * .5;
		//		c_list = [-_line, -_line, -_line, -_line];
		//		break;
		//		case 3: //Back100% + Front25%
		//		transparency = _transparency * .25;
		//		break;
		//	}
		//	break;
		//}
		#endregion
		transparency = _transparency;
		draw_set_alpha(transparency);
		draw_set_colour(_line);
		#region Prim colors test [disabled]
		//for (var b = 0; b < array_length(prim_array[i + _offset].colors); b++){
		//	red = prim_array[i + _offset].colors[b].r// * 8;
		//	green = prim_array[i + _offset].colors[b].g// * 8;
		//	blue = prim_array[i + _offset].colors[b].b// * 8;
		//	rgb = make_colour_rgb(red,green,blue);
				
		//	c_list[b] = rgb;
		//}
		#endregion
			
		#region Prim Fill Section
		if !(instance_exists(ImportTIM)){
			draw_primitive_begin_texture(pr_trianglelist, -1);
			
			for (var b = 0; b < array_length(x_list) - 2; b++){ //Repeats with +1 index if more than 3 verts exist
				switch(page_list[b] + 16){
				case 28:
				grid_x = p28_Window.left + 2;
				grid_y = p28_Window.top + 2;
				break;
					
				case 29:
				grid_x = p29_Window.left + 2;
				grid_y = p29_Window.top + 2;
				break;
					
				case 30:
				grid_x = p30_Window.left + 2;
				grid_y = p30_Window.top + 2;
				break;
					
				case 31:
				grid_x = p31_Window.left + 2;
				grid_y = p31_Window.top + 2;
				break;
			}
				draw_vertex_colour(grid_x + (x_list[0 + b]), grid_y + (y_list[0 + b]), _fill, transparency);
				draw_vertex_colour(grid_x + (x_list[1 + b]), grid_y + (y_list[1 + b]), _fill, transparency);
				draw_vertex_colour(grid_x + (x_list[2 + b]), grid_y + (y_list[2 + b]), _fill, transparency);
				//draw_vertex_colour(grid_x + (x_list[0 + b]), grid_y + (y_list[0 + b]), c_list[0 + b], transparency);
				//draw_vertex_colour(grid_x + (x_list[1 + b]), grid_y + (y_list[1 + b]), c_list[1 + b], transparency);
				//draw_vertex_colour(grid_x + (x_list[2 + b]), grid_y + (y_list[2 + b]), c_list[2 + b], transparency);
			}
		draw_primitive_end();
		}
		else{
			draw_primitive_begin_texture(pr_trianglelist, -1);
			
			for (var b = 0; b < array_length(x_list) - 2; b++){ //Repeats with +1 index if more than 3 verts exist
				switch(page_list[b] + 16){
					case 28:
					grid_x = p28_Window.left + 2;
					grid_y = p28_Window.top + 2;
					break;
					
					case 29:
					grid_x = p29_Window.left + 2;
					grid_y = p29_Window.top + 2;
					break;
					
					case 30:
					grid_x = p30_Window.left + 2;
					grid_y = p30_Window.top + 2;
					break;
					
					case 31:
					grid_x = p31_Window.left + 2;
					grid_y = p31_Window.top + 2;
					break;
				}
				draw_vertex_colour(grid_x + (x_list[0 + b]), grid_y + (y_list[0 + b]), _fill, .4);
				draw_vertex_colour(grid_x + (x_list[1 + b]), grid_y + (y_list[1 + b]), _fill, .4);
				draw_vertex_colour(grid_x + (x_list[2 + b]), grid_y + (y_list[2 + b]), _fill, .4);
				//draw_vertex_colour(grid_x + (x_list[0 + b]), grid_y + (y_list[0 + b]), c_list[0 + b], transparency);
				//draw_vertex_colour(grid_x + (x_list[1 + b]), grid_y + (y_list[1 + b]), c_list[1 + b], transparency);
				//draw_vertex_colour(grid_x + (x_list[2 + b]), grid_y + (y_list[2 + b]), c_list[2 + b], transparency);
			}
		draw_primitive_end();
		}
		draw_set_alpha(_transparency);
		#endregion
			
		
		//draws polygon lines
		draw_primitive_begin(pr_linestrip);
		for (var b = 0; b < array_length(x_list) - 2; b++){ //Repeats with +1 index if more than 3 verts exist
			switch(page_list[b] + 16){
				case 28:
				grid_x = p28_Window.left + 2;
				grid_y = p28_Window.top + 2;
				break;
					
				case 29:
				grid_x = p29_Window.left + 2;
				grid_y = p29_Window.top + 2;
				break;
					
				case 30:
				grid_x = p30_Window.left + 2;
				grid_y = p30_Window.top + 2;
				break;
					
				case 31:
				grid_x = p31_Window.left + 2;
				grid_y = p31_Window.top + 2;
				break;
			}
			draw_vertex(grid_x + (x_list[0 + b]), grid_y + (y_list[0 + b]));
			draw_vertex(grid_x + (x_list[1 + b]), grid_y + (y_list[1 + b]));
			draw_vertex(grid_x + (x_list[2 + b]), grid_y + (y_list[2 + b]));
			draw_vertex(grid_x + (x_list[0 + b]), grid_y + (y_list[0 + b]));
		}
		draw_primitive_end();

		#region Vertex Draw [disabled]
		//If a vertex color is given, a 3x3 square is drawn over each vertex in that color
		//if (_vertex_color != 0){
		//	for (var a = 0; a < array_length(x_list); a++){
		//		draw_set_colour(_vertex_color);
		//		draw_primitive_begin(pr_trianglelist);
		//		draw_vertex(2 + grid_x + x_list[a] - vert_size, 2 + grid_y + y_list[a] - vert_size);
		//		draw_vertex(2 + grid_x + x_list[a] + vert_size, 2 + grid_y + y_list[a] - vert_size);
		//		draw_vertex(2 + grid_x + x_list[a] - vert_size, 2 + grid_y + y_list[a] + vert_size);
		//		draw_vertex(2 + grid_x + x_list[a] + vert_size, 2 + grid_y + y_list[a] - vert_size);
		//		draw_vertex(2 + grid_x + x_list[a] - vert_size, 2 + grid_y + y_list[a] + vert_size);
		//		draw_vertex(2 + grid_x + x_list[a] + vert_size, 2 + grid_y + y_list[a] + vert_size);
		//		draw_primitive_end();
		//	}
		//}
		#endregion
	}
	gpu_set_blendmode(bm_normal);
	draw_set_colour(c_white);
	draw_set_alpha(1);
}