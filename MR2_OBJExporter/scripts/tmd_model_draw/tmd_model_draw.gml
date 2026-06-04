//draws each primitive in _prim_array[i]with _fill color and a _line color
//_base_offset is added to _prim_array[i]'s index
//_prim_array[i][_base_offset + i].tex

function tmd_model_draw(_prim_array, _object, _x, _y, _view1 = 0, _view2 = 0, _offset, _count, _fill, _line, _vertex_color = 0, _scale = 1, _transparency = 1){
	function v_data(_cmd, _c_mode, _t_mode, _colors, _ax, _az) constructor{
		x_list = [];
		y_list = [];
		cmd = _cmd;
		c_mode = _c_mode;
		t_mode = _t_mode;
		colors = _colors;
		ax = _ax;
		az = _az;
	}
	p_list = [];
	prim_array = [];
	vert_size = 2;
	xsedit = 1;
	ysedit = 1;
	prim = [];
	transparency = _transparency;
	x_sort = function sortx(a,b) {
		if (a.ax > b.ax){
				return -1;
			}
			else if (a.ax <= b.ax){
				return 1;
			}
			else{
				return 0;
			}
		}
	z_sort = function sortz(a,b) {
		if (a.az > b.az){
			return -1;
		}
		else if (a.az <= b.az){
			return 1;
		}
		else{
			return 0;
		}
	}
	x2_sort = function sortx2(a,b) {
		if (a.ax > b.ax){
			return 1;
		}
		else if (a.ax <= b.ax){
			return -1;
		}
		else{
			return 0;
		}
	}
	z2_sort = function sortz2(a,b) {
		if (a.az > b.az){
			return 1;
		}
		else if (a.az <= b.az){
			return -1;
		}
		else{
			return 0;
		}
	}
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
		//prim_array = tmd_draw.prim;
	}
	else{
		prim_array = [_prim_array];
	}
	
	z_depth = []; //z average for each prim to be sorted by, based on _view1

	p_count = 0;
	for (var i = 0; i < _count; i++){ //Cycles through primitives

		//x_list = []; //x coords to be drawn
		//y_list = []; //y coords to be drawn
		
		
		
		test = prim_array[i + _offset].p_index// + _offset;
		vert_data = new v_data(
			tmd_edit.prim[test].cmd,
			tmd_edit.prim[test].c_mode,
			tmd_edit.prim[test].t_mode,
			tmd_edit.prim[test].colors,
			tmd_edit.prim[test].ax,
			tmd_edit.prim[test].az
		);
		array_push(p_list, vert_data);
		for (var b = 0; b < array_length(tmd_draw.prim[test].vert); b++){ //mmj obj problem is here
			
			v_index = tmd_edit.prim[test].vert[b] + ((tmd_edit.objects[_object].vert_off - tmd_edit.objects[0].vert_off) / 8);
			view1 = [tmd_edit.vert[v_index].vx, tmd_edit.vert[v_index].vz];
			view2 = tmd_edit.vert[v_index].vy;
			

			//need to change below into array_push(p_list[p_count].x_list, )
			switch (_view1){
				case 0:
				array_push(p_list[p_count].x_list, view1[0] * _scale);
				array_push(p_list[p_count].y_list, view2 * _scale);
				//p_list.y_list[p_count] = view2 * _scale;
				//p_list.ax[p_count] = tmd_edit.prim[test].ax;
				//p_list.az[p_count] = tmd_edit.prim[test].az;
				//array_push(z_depth, prim_array[i].az);
				break;
				
				case 1:
				array_push(p_list[p_count].x_list, view1[1] * _scale);
				array_push(p_list[p_count].y_list, view2 * _scale);
				//p_list[p_count] = new v_data(
				//	view1[1] * _scale,
				//	view2 * _scale,
				//	tmd_edit.prim[test].ax,
				//	tmd_edit.prim[test].az
				//);
				//array_push(z_depth, prim_array[i].ax);
				break;
				
				case 2:
				array_push(p_list[p_count].x_list, view1[0] * _scale);
				array_push(p_list[p_count].y_list, view2 * _scale);
				//p_list[p_count] = new v_data(
				//	view1[0] * _scale,
				//	view2 * _scale,
				//	tmd_edit.prim[test].ax,
				//	tmd_edit.prim[test].az
				//);
				//array_push(z_depth, prim_array[i].az);
				break;
				
				case 3:
				array_push(p_list[p_count].x_list, -(view1[1] * _scale));
				array_push(p_list[p_count].y_list, view2 * _scale);
				//p_list[p_count] = new v_data(
				//	-(view1[1] * _scale),
				//	view2 * _scale,
				//	tmd_edit.prim[test].ax,
				//	tmd_edit.prim[test].az
				//);
				//array_push(z_depth, prim_array[i].ax);
				break;
			
			}
			
		}
		p_count++;
	}
	switch (draw_tmd_view){ //Sorting based on view tmd_window angle
			case 0: //Front
			array_sort(p_list, z_sort);
			break;
				
			case 1: //Side1
			array_sort(p_list, x_sort);
			break;
				
			case 2: //Back
			array_sort(p_list, z2_sort); 
			break;
				
			case 3: //Side2
			array_sort(p_list, x2_sort);
			break;
		}
	for (var i = 0; i < _count; i++){ //Cycles through primitives
		var c = 0;
		if (p_list[i].cmd & 0b0001 == 1){
			draw_set_colour($FF494949);
		}
		else if(p_list[i].c_mode == 0){
			draw_set_colour($FF392929);
		}
		else{
			draw_set_colour(_fill);
		}
		c_list = [_fill, _fill, _fill, _fill];
		switch ((p_list[i].cmd >> 1) & 0b1){
			case 0:
			transparency = _transparency;
			break;
			case 1:
			switch (p_list[i].t_mode){
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
		
		for (var b = 0; b < array_length(p_list[i].colors); b++){
			red = p_list[i].colors[b].r;
			green = p_list[i].colors[b].g;
			blue = p_list[i].colors[b].b;
			rgb = make_colour_rgb(red,green,blue);
				
			c_list[b] = rgb;
		}
		draw_primitive_begin(pr_trianglelist);
		draw_vertex_colour(x_loc + p_list[i].x_list[0], y_loc + p_list[i].y_list[0], c_list[0], transparency);
		draw_vertex_colour(x_loc + p_list[i].x_list[1], y_loc + p_list[i].y_list[1], c_list[1], transparency);
		draw_vertex_colour(x_loc + p_list[i].x_list[2], y_loc + p_list[i].y_list[2], c_list[2], transparency);
		
			
		if (array_length(p_list[i].x_list) > 3){	//fourth vertex check
			draw_vertex_colour(x_loc + p_list[i].x_list[1], y_loc + p_list[i].y_list[1], c_list[1], transparency);
			draw_vertex_colour(x_loc + p_list[i].x_list[2], y_loc + p_list[i].y_list[2], c_list[2], transparency);
			draw_vertex_colour(x_loc + p_list[i].x_list[3], y_loc + p_list[i].y_list[3], c_list[3], transparency);
		}
		draw_primitive_end();
			
		//draw_set_alpha(_transparency);


		//draws polygon lines
		if (p_list[i].c_mode == 0){
			draw_set_colour(_fill);
		}
		else{
			draw_set_colour(_line);
		}
		draw_primitive_begin(pr_linestrip);
		draw_vertex((x_loc + p_list[i].x_list[1] * 1),(y_loc + p_list[i].y_list[1] * 1));
		draw_vertex((x_loc + p_list[i].x_list[2] * 1),(y_loc + p_list[i].y_list[2] * 1));
		draw_vertex((x_loc + p_list[i].x_list[0] * 1),(y_loc + p_list[i].y_list[0] * 1));
		draw_vertex((x_loc + p_list[i].x_list[1] * 1),(y_loc + p_list[i].y_list[1] * 1));
		draw_primitive_end();


		if (array_length(p_list[i].x_list) > 3){	//fourth vertex check
			draw_primitive_begin(pr_linestrip);
			draw_vertex((x_loc + p_list[i].x_list[1] * 1),(y_loc + p_list[i].y_list[1] * 1));
			draw_vertex((x_loc + p_list[i].x_list[2] * 1),(y_loc + p_list[i].y_list[2] * 1));
			draw_vertex((x_loc + p_list[i].x_list[3] * 1),(y_loc + p_list[i].y_list[3] * 1));
			draw_primitive_end();
		}
			
		//If a vertex color is given, a 3x3 square is drawn over each vertex in that color
		if (_vertex_color != 0){
			for (var a = 0; a < array_length(p_list[i].x_list); a++){
				draw_set_colour(_vertex_color);
				draw_primitive_begin(pr_trianglelist);
				draw_vertex(x_loc + p_list[i].x_list[a] - vert_size, y_loc + p_list[i].y_list[a] - vert_size);
				draw_vertex(x_loc + p_list[i].x_list[a] + vert_size, y_loc + p_list[i].y_list[a] - vert_size);
				draw_vertex(x_loc + p_list[i].x_list[a] - vert_size, y_loc + p_list[i].y_list[a] + vert_size);
				draw_vertex(x_loc + p_list[i].x_list[a] + vert_size, y_loc + p_list[i].y_list[a] - vert_size);
				draw_vertex(x_loc + p_list[i].x_list[a] - vert_size, y_loc + p_list[i].y_list[a] + vert_size);
				draw_vertex(x_loc + p_list[i].x_list[a] + vert_size, y_loc + p_list[i].y_list[a] + vert_size);
				draw_primitive_end();
			}
		}
	}
	draw_set_colour(c_white);
	draw_set_alpha(1);
}