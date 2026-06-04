//Fill with surface builders on timers
//if (draw_refresh == 0){
//	exit;
//}
if (!surface_exists(draw_ui_grid)){
	draw_ui_grid = surface_create(512, 512);
	surface_set_target(draw_ui_grid);
	draw_clear_alpha(c_white, true);
	
	
	surface_reset_target();
	view_surface_id[0] = draw_ui_grid;
	draw_set_alpha(1);
}


if (ds_list_size(tim_list) != 0){
	if (!surface_exists(vram28)){
		vram28 = surface_create(256, 256);
	}
	surface_set_target(vram28);
	draw_clear_alpha(c_white, true);
	for (var a = 0; a < ds_list_size(tim_list);a++){
		px = tim_list[|a].pixel_x - 768;
		if (px < 0 || px > 63){
			continue;
		}
		tim_rgb_draw(- 768, -256, tim_list[|a], 1, 1, 1);
		draw_check28 = true;
	}
	surface_reset_target();
	view_surface_id[0] = vram28;
	draw_set_alpha(1);
	
	if (!surface_exists(vram29)){
		vram29 = surface_create(256, 256);
	}
	surface_set_target(vram29);
	draw_clear_alpha(c_white, true);
	for (var a = 0; a < ds_list_size(tim_list);a++){
		px = tim_list[|a].pixel_x - 832;
		if (px < 0 || px > 63){
			continue;
		}
		tim_rgb_draw(- 832, -256, tim_list[|a], 1, 1, 1);
		draw_check29 = true;
	}
	surface_reset_target();
	view_surface_id[0] = vram29;
	draw_set_alpha(1);
	
	if (!surface_exists(vram30)){
		vram30 = surface_create(256, 256);
	}
	surface_set_target(vram30);
	draw_clear_alpha(c_white, true);
	for (var a = 0; a < ds_list_size(tim_list);a++){
		px = tim_list[|a].pixel_x - 896;
		if (px < 0 || px > 63){
			continue;
		}
		tim_rgb_draw(- 896, -256, tim_list[|a], 1, 1, 1);
		draw_check30 = true;
	}
	surface_reset_target();
	view_surface_id[0] = vram30;
	draw_set_alpha(1);
	
	if (!surface_exists(vram31)){
		vram31 = surface_create(256, 256);
	}
	surface_set_target(vram31);
	draw_clear_alpha(c_white, true);
	for (var a = 0; a < ds_list_size(tim_list);a++){
		px = tim_list[|a].pixel_x - 960;
		if (px < 0 || px > 63){
			continue;
		}
		tim_rgb_draw(- 960, -256, tim_list[|a], 1, 1, 1);
		draw_check31 = true;
	}
	surface_reset_target();
	view_surface_id[0] = vram31;
	draw_set_alpha(1);
}
	
	
//	if (((draw_refresh >> 1) & 0b1) == 1 || array_length(draw_ui_tim) == 0){
//		//tx = grid_x + tim_list[|ui_tim].pixel_x - ((ui_page-16)*64);
//		//ty = grid_y + tim_list[|ui_tim].pixel_y - 256;
//		alpha = 1;
//		switch (ui_tim_draw_layer){
//			case 0:
//			alpha = 1;
//			break;
//			case 1:
//			alpha = .7;
//			break;
//		}
//		for (var a = 0; a < ds_list_size(tim_list); a++){
//			if (array_length(draw_ui_tim) < a + 1){
//				draw_ui_tim[a] = 0;
//			}
//			bit_mode = tim_list[|a].bit;
//			switch (bit_mode){
//				case 0:
//				mult = 4;
//				break;
//				case 1:
//				mult = 2;
//				break;
//			}
//			if (!surface_exists(draw_ui_tim[a])){
//				draw_ui_tim[a] = surface_create(tim_list[|a].pixel_w * mult * 2, tim_list[|a].pixel_h * mult);
//			}
//			surface_set_target(draw_ui_tim[a]);
//			draw_clear_alpha(c_white, true);
//			tim_rgb_draw(0, 0, tim_list[|a], alpha);
//			surface_reset_target();
//			view_surface_id[0] = draw_ui_tim[a];
//			draw_set_alpha(1);
//		}
//		draw_refresh = draw_refresh & ~2;
//	}
//}

//if (ds_list_size(tim_list) != 0){
//	if (timer % 5 || !surface_exists(draw_vram)){
//		vram(0,0,1,1);
//		surface_set_target(draw_ui_grid);
//		draw_clear_alpha(c_white, true);
//		draw_surface(draw_vram, -((ui_page - 16) * 64 * 4), -512)
	
//		surface_reset_target();
//		view_surface_id[0] = draw_ui_grid;
//		draw_set_alpha(1);
//	}
//}

//if (timer % 5){
	

//	if ((draw_refresh & 0b1) == 1 || !surface_exists(draw_ui_tmd)){
		
//		tmd_view_zoom = tmd_view_scale * draw_tmd_zoom;

//		draw_ui_tmd = surface_create(tmd_window.width - 8, tmd_window.height - 8);
		
//		surface_set_target(draw_ui_tmd);
//		draw_clear_alpha(c_black, 0);
		

		
//		if (mm0_base_buffer != -1){
			
			
//			if (array_length(box_select) != 0 || array_length(prim_select) != 0){
//				tmd_transparency = .5
//			}
//			else{
//				tmd_transparency = 1;
//			}
//			switch(draw_tmd_view){
//				case 0:
//				view_depth = tmd_draw_z;
//				break;
//				case 1:
//				view_depth = tmd_draw_x;
//				break;
//				case 2:
//				view_depth = tmd_draw_z2;
//				break;
//				case 3:
//				view_depth = tmd_draw_x2;
//				break;
//			}
			
//			p_list = variable_clone(tmd_edit.prim); //sorted prims that'll fill x_list and y_list
		
//			//switch (draw_tmd_view){ //Sorting based on view tmd_window angle
//			//	case 0: //Front
//			//	array_sort(p_list, z_sort);
//			//	break;
				
//			//	case 1: //Side1
//			//	array_sort(p_list, x_sort);
//			//	break;
				
//			//	case 2: //Back
//			//	array_sort(p_list, z2_sort); 
//			//	break;
				
//			//	case 3: //Side2
//			//	array_sort(p_list, x2_sort);
//			//	break;
//			//}
//			prim_base = tmd_edit.objects[ui_obj].prim_index - tmd_edit.objects[ui_obj].prim_num;
			
//			for (var a = 0; a < array_length(tmd_edit.objects); a++){
//				obj_base = tmd_edit.objects[a].prim_index - tmd_edit.objects[a].prim_num;
//				tmd_model_draw(tmd_draw.prim, a, tmd_window.width / 2, tmd_window.height, draw_tmd_view, 0, obj_base, tmd_edit.objects[a].prim_num, c_black, c_white, 0, tmd_view_zoom / 2, tmd_transparency * .5);
//			}
//			tmd_model_draw(tmd_draw.prim, ui_obj, tmd_window.width / 2, tmd_window.height, draw_tmd_view, 0, prim_base, tmd_edit.objects[ui_obj].prim_num, c_black, c_white, 0, tmd_view_zoom / 2, tmd_transparency);
			
	
//			//tmd_model_draw(prim_select, tmd_window.width / 2, tmd_window.height, draw_tmd_view, draw_tmd_view_2, 0, array_length(prim_select), $FF6DFCED, $FFFFC7D4, 0, tmd_view_zoom / 2, 1);
//			tmd_model_draw(prim_select, ui_obj, tmd_window.width / 2, tmd_window.height, draw_tmd_view, 0, 0, array_length(prim_select), $FFC9B759, $FFFFC7D4, 0, tmd_view_zoom / 2, 1.5);
//			if (array_length(box_select) != 0){
//				box_highlight = coord_bounds(
//					prim_draw, 
//					((box_select[0])), 
//					((box_select[1])), 
//					(mouse_x), 
//					(mouse_y)
//				);
//				if (array_length(box_highlight) != 0){ 
//					tmd_model_draw(box_highlight, ui_obj, tmd_window.width / 2, tmd_window.height, draw_tmd_view, 0, 0, array_length(box_highlight), $FF66B759, $FFFFC7D4, c_red, tmd_view_zoom / 2, 1.5);
//				}
//			}
//			if (ui_prim_highlight != 0){
//				tmd_model_draw(tmd_draw.prim[ui_prim], ui_obj, tmd_window.width / 2, tmd_window.height, draw_tmd_view, 0, 0, 1, $FF6DFCED, $FFFFC7D4, c_red, tmd_view_zoom / 2, 1.5);
//			}
//		}
//		surface_reset_target();
//		view_surface_id[0] = draw_ui_tmd;
//		draw_set_alpha(1);
//		draw_refresh = draw_refresh & ~0b1;
//	}
//}



timer++;
if (timer > 30){
	timer = 0;
}