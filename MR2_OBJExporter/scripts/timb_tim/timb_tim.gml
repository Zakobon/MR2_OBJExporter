function timb_tim(){
	max_w = 0;
	max_h = 0;
	num_rows = ceil(sqrt(ds_list_size(tim_list))); //number of TIM rows/columns of new png
	for (var a = 0; a < ds_list_size(tim_list);a++){
		switch (tim_list[|a].bit){
			case 0:
			mult = 4;
			break;
			case 1:
			mult = 2;
			break;
		}
		if (tim_list[|a].pixel_w * mult > max_w){
			max_w = tim_list[|a].pixel_w * mult;
		}
		if (tim_list[|a].pixel_h > max_h){
			max_h = tim_list[|a].pixel_h;
		}
	}
	
	if !(surface_exists(surf)){
		surf = surface_create(max_w * num_rows, max_h * num_rows);
	}
	
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0);
	
	for (var a = 0; a < ds_list_size(tim_list); a++){
		timb_x = max_w * (a mod num_rows);
		timb_y = max_h * (a div num_rows);	
		switch (tim_list[|a].bit){
			case 0:
			offset = 0;
			mult = 4;
			break;
			case 1:
			offset = 1024;
			mult = 2;
			break;
		}
		if (a == 14){
			test = 0;
		}
		tim_x = offset + (((tim_list[|a].pixel_x_origin div 64) * 64) * 4);
		tim_x += (tim_list[|a].pixel_x mod 64) * mult;
		tim_y = tim_list[|a].pixel_y mod 256;
		tim_w = tim_list[|a].pixel_w * mult;
		tim_h = tim_list[|a].pixel_h;
		page = tim_list[|a].pixel_x div 64;
		draw_set_alpha(1);
		tim_sprite = grid_sprites[0][0];
		switch (page){
			case 12:
			if (grid_mode28[0] == 1){
				tim_sprite = grid_sprites[grid_mode28[1] + 1,grid_mode28[2]]
			}
			break;
			case 13:
			if (grid_mode29[0] == 1){
				tim_sprite = grid_sprites[grid_mode29[1] + 1,grid_mode29[2]]
			}
			break;
			case 14:
			if (grid_mode30[0] == 1){
				tim_sprite = grid_sprites[grid_mode30[1] + 1,grid_mode30[2]]
			}
			break;
			case 15:
			if (grid_mode31[0] == 1){
				tim_sprite = grid_sprites[grid_mode31[1] + 1,grid_mode31[2]]
			}
			break;
		}
		draw_sprite_part(tim_sprite, 0, tim_x, tim_y, tim_w, tim_h, timb_x, timb_y);
	}
	
	timb_sprite = sprite_create_from_surface(surf, 0, 0, max_w * num_rows, max_h * num_rows, false, false, 0, 0);
	
	surface_reset_target();
	surface_free(surf);
}