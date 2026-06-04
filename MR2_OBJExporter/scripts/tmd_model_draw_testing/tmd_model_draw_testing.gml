//draws each primitive in _prim_array[i + _offset]with _fill color and a _line color
//_base_offset is added to _prim_array[i + _offset]'s index
//_prim_array[i + _offset][_base_offset + i].tex

function tmd_model_draw_testing(_prim_array, _object, _x, _y, _view1 = 0, _view2 = 0, _offset, _count, _fill, _line, _vertex_color = 0, _scale = 1, _transparency = 1){
	prim_array = [];
	vert_size = 2;
	xsedit = 1;
	ysedit = 1;
	prim = [];
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
		prim_array = _prim_array;
	}
	else{
		prim_array = [_prim_array];
	}
	z_list = [];
	xy_list = [];
	y_list = [];
	for (var i = 0; i < _count; i++){
		
		//transparency commmand
		if ((prim_array[i + _offset].cmd & 0b0010) == 2){
			draw_set_alpha(_transparency * .7);
		}
		else{
			draw_set_alpha(_transparency);
		}
		page = prim_array[i + _offset].page_x;

		
		function xyz_list(_array,_xvalue,_yvalue,_zvalue) {
			array_push(_array, {xval : _xvalue,yval : _yvalue, zval : _zvalue})
		}
		
		
		for (var b = 0; b < array_length(prim_array[i + _offset].vert); b++){
			v_index = prim_array[i + _offset].vert[b] + ((tmd_edit.objects[_object].vert_off - tmd_edit.objects[0].vert_off) / 8);
			view1 = [tmd_edit.vert[v_index].vx, tmd_edit.vert[v_index].vz];
			view2 = tmd_edit.vert[v_index].vy;
			
			switch (_view1){
				case 0:
				xyz_list(xy_list, tmd_edit.vert[v_index].vx, tmd_edit.vert[v_index].vy, tmd_edit.vert[v_index].vz);
				break;
				
				case 1:
				xyz_list(xy_list, tmd_edit.vert[v_index].vz, tmd_edit.vert[v_index].vy, tmd_edit.vert[v_index].vx);
				break;
				
				case 2:
				xyz_list(xy_list, -tmd_edit.vert[v_index].vx, tmd_edit.vert[v_index].vy, tmd_edit.vert[v_index].vz);
				break;
				
				case 3:
				xyz_list(xy_list, -tmd_edit.vert[v_index].vz, tmd_edit.vert[v_index].vy, tmd_edit.vert[v_index].vx);
				break;
			}
			
			//switch (_view1){
			//	case 0:
			//	array_push(x_list, view1[0] * _scale);
			//	array_push(y_list, view2 * _scale);
			//	break;
				
			//	case 1:
			//	array_push(x_list, view1[1] * _scale);
			//	array_push(y_list, view2 * _scale);
			//	break;
				
			//	case 2:
			//	array_push(x_list, -(view1[0] * _scale));
			//	array_push(y_list, view2 * _scale);
			//	break;
				
			//	case 3:
			//	array_push(x_list, -(view1[1] * _scale));
			//	array_push(y_list, view2 * _scale);
			//	break;
			//}
		}
		z_total = 0;
		for (var b = 0; b < array_length(xy_list); b++){
			z_total += xy_list[b].zval;
		}
		z_total = z_total / array_length(xy_list);
		array_push(z_list, [xy_list, z_total]);
	}
		switch (_view1){
				case 0:
				array_sort(z_list, function(a, b) {return a[1] < b[1];});
				break;
				case 1:
				array_sort(z_list, function(a, b) {return a[1] < b[1];});
				break;
				case 2:
				array_sort(z_list, function(a, b) {return a[1] > b[1];});
				break;
				case 3:
				array_sort(z_list, function(a, b) {return a[1] > b[1];});
				break;
		}
		for (var i = 0; i < _count; i++){
			if (prim_array[i + _offset].cmd & 0b0001 == 1){
				draw_set_colour($FF494949);
			}
			else if(prim_array[i + _offset].c_mode == 0){
				draw_set_colour($FF392929);
			}
			else{
				draw_set_colour(_fill);
			}
			draw_primitive_begin(pr_trianglelist);
			draw_vertex(x_loc + z_list[i][0][0].xval, y_loc + z_list[i][0][0].yval);
			draw_vertex(x_loc + z_list[i][0][1].xval, y_loc + z_list[i][0][1].yval);
			draw_vertex(x_loc + z_list[i][0][2].xval, y_loc + z_list[i][0][2].yval);
			
			if (prim_array[i + _offset].cmd & 0b1000 == 8){	//fourth vertex check
				draw_vertex(x_loc + z_list[i][0][1].xval, y_loc + z_list[i][0][1].yval);
				draw_vertex(x_loc + z_list[i][0][2].xval, y_loc + z_list[i][0][2].yval);
				draw_vertex(x_loc + z_list[i][0][3].xval, y_loc + z_list[i][0][3].yval);
			}
			draw_primitive_end();
			
			draw_set_alpha(_transparency);


			//draws polygon lines
			if (prim_array[i + _offset].c_mode == 0){
				draw_set_colour(_fill);
			}
			else{
				draw_set_colour(_line);
			}
			draw_primitive_begin(pr_linestrip);
			draw_vertex((x_loc + z_list[i][0][0].xval * 1),(y_loc + z_list[i][0][0].yval * 1));
			draw_vertex((x_loc + z_list[i][0][1].xval * 1),(y_loc + z_list[i][0][1].yval * 1));
			draw_vertex((x_loc + z_list[i][0][2].xval * 1),(y_loc + z_list[i][0][2].yval * 1));
			draw_vertex((x_loc + z_list[i][0][0].xval * 1),(y_loc + z_list[i][0][0].yval * 1));
			draw_primitive_end();


			if (prim_array[i + _offset].cmd & 0b1000 == 8){	//fourth vertex check
				draw_primitive_begin(pr_linestrip);
				draw_vertex((x_loc + z_list[i][0][1].xval * 1),(y_loc + z_list[i][0][1].yval * 1));
				draw_vertex((x_loc + z_list[i][0][3].xval * 1),(y_loc + z_list[i][0][3].yval * 1));
				draw_vertex((x_loc + z_list[i][0][2].xval * 1),(y_loc + z_list[i][0][2].yval * 1));
				draw_primitive_end();
			}
			
			//If a vertex color is given, a 3x3 square is drawn over each vertex in that color
			if (_vertex_color != 0){
				for (var a = 0; a < array_length(z_list[i]); a++){
					draw_set_colour(_vertex_color);
					draw_primitive_begin(pr_trianglelist);
					draw_vertex(x_loc + z_list[i][0][a].xval - vert_size, y_loc + z_list[i][0][a].yval - vert_size);
					draw_vertex(x_loc + z_list[i][0][a].xval + vert_size, y_loc + z_list[i][0][a].yval - vert_size);
					draw_vertex(x_loc + z_list[i][0][a].xval - vert_size, y_loc + z_list[i][0][a].yval + vert_size);
					draw_vertex(x_loc + z_list[i][0][a].xval + vert_size, y_loc + z_list[i][0][a].yval - vert_size);
					draw_vertex(x_loc + z_list[i][0][a].xval - vert_size, y_loc + z_list[i][0][a].yval + vert_size);
					draw_vertex(x_loc + z_list[i][0][a].xval + vert_size, y_loc + z_list[i][0][a].yval + vert_size);
					draw_primitive_end();
				}
			}
		}
	
	draw_set_colour(c_white);
	draw_set_alpha(1);
}