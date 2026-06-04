//draws each primitive in _prim_array[i + _offset]with _fill color and a _line color
//_base_offset is added to _prim_array[i + _offset]'s index
//_prim_array[i + _offset][_base_offset + i].tex

function tmd_model_draw_backup_5_17_2026(_prim_array, _object, _x, _y, _view1 = 0, _view2 = 0, _offset, _count, _fill, _line, _vertex_color = 0, _scale = 1, _transparency = 1){
	prim_array = [];
	vert_size = 2;
	xsedit = 1;
	ysedit = 1;
	prim = [];
	transparency = _transparency;
	switch(_view2){
		case 0:
		x_loc = _x + draw_tmd_pan_x;
		y_loc = _y + draw_tmd_pan_y;
		break;
				
		case 1:
		x_loc = _x + draw_tmd_pan_x;
		y_loc = _y + draw_tmd_pan_y;
		break;
				
		case 2:
		x_loc = _x + draw_tmd_pan_x;
		y_loc = _y + draw_tmd_pan_y;
		break;
				
		case 3:
		x_loc = _x + draw_tmd_pan_x;
		y_loc = _y + draw_tmd_pan_y;
		break;
	}
	
	if(is_array(_prim_array)){
		//prim_array = _prim_array;
		prim_array = tmd_draw.prim;
	}
	else{
		prim_array = [_prim_array];
	}
	
	for (var i = 0; i < _count; i++){ //Cycles through primitives
		

		page = prim_array[i + _offset].page_x;

		x_list = []; //x coords to be drawn
		y_list = []; //y coords to be drawn
		
		
		z_depth = []; //z average for each prim to be sorted by, based on _view1
		p_list = []; //sorted prims that'll fill x_list and y_list
		
		//for (var b = 0; b <)
		for (var b = 0; b < array_length(prim_array[i + _offset].vert); b++){ //mmj obj problem is here
			v_index = prim_array[i + _offset].vert[b] + ((tmd_edit.objects[_object].vert_off - tmd_edit.objects[0].vert_off) / 8);
			view1 = [tmd_draw.vert[v_index].vx, tmd_draw.vert[v_index].vz];
			view2 = tmd_draw.vert[v_index].vy;

			switch (_view1){
				case 0:
				array_push(x_list, view1[0] * _scale);
				array_push(y_list, view2 * _scale);
				array_push(z_depth, prim_array[i + _offset].az);
				break;
				
				case 1:
				array_push(x_list, view1[1] * _scale);
				array_push(y_list, view2 * _scale);
				array_push(z_depth, prim_array[i + _offset].ax);
				break;
				
				case 2:
				array_push(x_list, -(view1[0] * _scale));
				array_push(y_list, view2 * _scale);
				array_push(z_depth, prim_array[i + _offset].az);
				break;
				
				case 3:
				array_push(x_list, -(view1[1] * _scale));
				array_push(y_list, view2 * _scale);
				array_push(z_depth, prim_array[i + _offset].ax);
				break;
			
			}
		}

		if (prim_array[i + _offset].cmd & 0b0001 == 1){
			draw_set_colour($FF494949);
		}
		else if(prim_array[i + _offset].c_mode == 0){
			draw_set_colour($FF392929);
		}
		else{
			draw_set_colour(_fill);
		}
		c_list = [_fill, _fill, _fill, _fill];
		switch ((prim_array[i + _offset].cmd >> 1) & 0b1){
			case 0:
			transparency = _transparency;
			break;
			case 1:
			switch (prim_array[i + _offset].t_mode){
				case 0: //Back50% + Front50%
				transparency = _transparency * .5;
				break;
				case 1: //Back100% + Front100%
				transparency = _transparency * .7;
				c_list = [_fill * 1.2, _fill * 1.2, _fill * 1.2, _fill * 1.2];
				break;
				case 2: //Back100% - Front100%
				transparency = _transparency * .5;
				c_list = [-_fill, -_fill, -_fill, -_fill];
				break;
				case 3: //Back100% + Front25%
				transparency = _transparency * .25;
				break;
			}
			break;
		}
		draw_set_alpha(transparency);
		
		for (var b = 0; b < array_length(prim_array[i + _offset].colors); b++){
			red = prim_array[i + _offset].colors[b].r;
			green = prim_array[i + _offset].colors[b].g;
			blue = prim_array[i + _offset].colors[b].b;
			rgb = make_colour_rgb(red,green,blue);
				
			c_list[b] = rgb;
		}
		draw_primitive_begin(pr_trianglelist);
		draw_vertex_colour(x_loc + x_list[0], y_loc + y_list[0], c_list[0], transparency);
		draw_vertex_colour(x_loc + x_list[1], y_loc + y_list[1], c_list[1], transparency);
		draw_vertex_colour(x_loc + x_list[2], y_loc + y_list[2], c_list[2], transparency);
			
		if (prim_array[i + _offset].cmd & 0b1000 == 8){	//fourth vertex check
			draw_vertex_colour(x_loc + x_list[1], y_loc + y_list[1], c_list[1], transparency);
			draw_vertex_colour(x_loc + x_list[2], y_loc + y_list[2], c_list[2], transparency);
			draw_vertex_colour(x_loc + x_list[3], y_loc + y_list[3], c_list[3], transparency);
		}
		draw_primitive_end();
			
		//draw_set_alpha(_transparency);


		//draws polygon lines
		if (prim_array[i + _offset].c_mode == 0){
			draw_set_colour(_fill);
		}
		else{
			draw_set_colour(_line);
		}
		draw_primitive_begin(pr_linestrip);
		draw_vertex((x_loc + x_list[0] * 1),(y_loc + y_list[0] * 1));
		draw_vertex((x_loc + x_list[1] * 1),(y_loc + y_list[1] * 1));
		draw_vertex((x_loc + x_list[2] * 1),(y_loc + y_list[2] * 1));
		draw_vertex((x_loc + x_list[0] * 1),(y_loc + y_list[0] * 1));
		draw_primitive_end();


		if (prim_array[i + _offset].cmd & 0b1000 == 8){	//fourth vertex check
			draw_primitive_begin(pr_linestrip);
			draw_vertex((x_loc + x_list[1] * 1),(y_loc + y_list[1] * 1));
			draw_vertex((x_loc + x_list[3] * 1),(y_loc + y_list[3] * 1));
			draw_vertex((x_loc + x_list[2] * 1),(y_loc + y_list[2] * 1));
			draw_primitive_end();
		}
			
		//If a vertex color is given, a 3x3 square is drawn over each vertex in that color
		if (_vertex_color != 0){
			for (var a = 0; a < array_length(x_list); a++){
				draw_set_colour(_vertex_color);
				draw_primitive_begin(pr_trianglelist);
				draw_vertex(x_loc + x_list[a] - vert_size, y_loc + y_list[a] - vert_size);
				draw_vertex(x_loc + x_list[a] + vert_size, y_loc + y_list[a] - vert_size);
				draw_vertex(x_loc + x_list[a] - vert_size, y_loc + y_list[a] + vert_size);
				draw_vertex(x_loc + x_list[a] + vert_size, y_loc + y_list[a] - vert_size);
				draw_vertex(x_loc + x_list[a] - vert_size, y_loc + y_list[a] + vert_size);
				draw_vertex(x_loc + x_list[a] + vert_size, y_loc + y_list[a] + vert_size);
				draw_primitive_end();
			}
		}
	}
	draw_set_colour(c_white);
	draw_set_alpha(1);
}