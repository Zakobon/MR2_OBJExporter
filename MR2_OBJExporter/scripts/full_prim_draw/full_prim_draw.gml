//draws each primitive in _prim_array[i]with _line color and a _line color
//_base_offset is added to _prim_array[i]'s index
//_prim_array[i][_base_offset + i].tex

function full_prim_draw(_prim_array, _line, _transparency = 1){
	prim_array = [];
	vert_size = 2;
	prim = [];
	x_off = 0;
	coord_minmax(_prim_array);
	draw_set_alpha(_transparency);
	
	for (var i = 0; i < array_length(prim_array); i++){
		page = prim_array[i].page_x;
		bit = prim_array[i].c_mode;
		flag_index = -1;
		switch(bit){
			case 0:
			x_off = 0;
			flag_index = 0;
			break;
			case 1:
			x_off = 1024;
			flag_index = 4;
			break;
		}
		
		switch(page + 16){
			case 28:
			x_off += 0 * 256;
			flag_index += 0;
			break;
					
			case 29:
			x_off += 1 * 256;
			flag_index += 1;
			break;
					
			case 30:
			x_off += 2 * 256;
			flag_index += 2;
			break;
					
			case 31:
			x_off += 3 * 256;
			flag_index += 3;
			break;
		}
		
		prim_sprites[flag_index][0] = true;
		x_list = [];
		y_list = [];
		page_list = [];
		
		for (var b = 0; b < array_length(prim_array[i].tex_x); b++){
			x_base = (prim_array[i].tex_x[b]);
			y_base = (prim_array[i].tex_y[b]);
			
			array_push(x_list, x_base);
			array_push(y_list, y_base);
		}
		

		
		#region Prim colors test [disabled]
		//c_list = [_line, _line, _line, _line];
		//for (var b = 0; b < array_length(prim_array[i].colors); b++){
		//	red = prim_array[i].colors[b].r// * 8;
		//	green = prim_array[i].colors[b].g// * 8;
		//	blue = prim_array[i].colors[b].b// * 8;
		//	rgb = make_colour_rgb(red,green,blue);
				
		//	c_list[b] = rgb;
		//}
		#endregion
			
		#region Prim Fill Section [disabled]
		//if !(instance_exists(ImportTIM)){
		//	draw_primitive_begin_texture(pr_trianglelist, -1);
			
		//	for (var b = 0; b < array_length(x_list) - 2; b++){ //Repeats with +1 index if more than 3 verts exist
		//		draw_vertex_colour(x_off + (x_list[0 + b]), (y_list[0 + b]), _fill, _transparency);
		//		draw_vertex_colour(x_off + (x_list[1 + b]), (y_list[1 + b]), _fill, _transparency);
		//		draw_vertex_colour(x_off + (x_list[2 + b]), (y_list[2 + b]), _fill, _transparency);
		//		//draw_vertex_colour(x_off + (x_list[0 + b]), (y_list[0 + b]), c_list[0 + b], transparency);
		//		//draw_vertex_colour(x_off + (x_list[1 + b]), (y_list[1 + b]), c_list[1 + b], transparency);
		//		//draw_vertex_colour(x_off + (x_list[2 + b]), (y_list[2 + b]), c_list[2 + b], transparency);
		//	}
		//draw_primitive_end();
		//}
		//else{
		//	draw_primitive_begin_texture(pr_trianglelist, -1);
			
		//	for (var b = 0; b < array_length(x_list) - 2; b++){ //Repeats with +1 index if more than 3 verts exist
		//		draw_vertex_colour(x_off + (x_list[0 + b]), (y_list[0 + b]), _fill, .1);
		//		draw_vertex_colour(x_off + (x_list[1 + b]), (y_list[1 + b]), _fill, .1);
		//		draw_vertex_colour(x_off + (x_list[2 + b]), (y_list[2 + b]), _fill, .1);
		//		//draw_vertex_colour(x_off + (x_list[0 + b]), (y_list[0 + b]), c_list[0 + b], transparency);
		//		//draw_vertex_colour(x_off + (x_list[1 + b]), (y_list[1 + b]), c_list[1 + b], transparency);
		//		//draw_vertex_colour(x_off + (x_list[2 + b]), (y_list[2 + b]), c_list[2 + b], transparency);
		//	}
		//draw_primitive_end();
		//}
		//draw_set_alpha(_transparency);
		#endregion
		
			draw_set_alpha(_transparency);
		draw_set_colour(_line);
		//draws polygon lines
		draw_primitive_begin(pr_linestrip);
		for (var b = 0; b < array_length(x_list) - 2; b++){ //Repeats with +1 index if more than 3 verts exist
			draw_vertex(x_off + (x_list[0 + b]), (y_list[0 + b]));
			draw_vertex(x_off + (x_list[1 + b]), (y_list[1 + b]));
			draw_vertex(x_off + (x_list[2 + b]), (y_list[2 + b]));
			draw_vertex(x_off + (x_list[0 + b]), (y_list[0 + b]));
		}
		draw_primitive_end();
	}
	gpu_set_blendmode(bm_normal);
	draw_set_colour(c_white);
	draw_set_alpha(1);
}