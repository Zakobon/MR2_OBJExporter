var grid_button_active = variable_instance_get(grid_button, "active");

if (grid_button_active == 1){
	grid_mode = !grid_mode;
	variable_instance_set(grid_button, "active", 0);
	switch (grid_mode){
		case 0:
		PageModeTIM.vram28 = PageModeTIM.vram28 & ~0b01;
		PageModeTIM.vram29 = PageModeTIM.vram29 & ~0b01;
		PageModeTIM.vram30 = PageModeTIM.vram30 & ~0b01;
		PageModeTIM.vram31 = PageModeTIM.vram31 & ~0b01;
		break;
		case 1:
		PageModeTIM.vram28 = PageModeTIM.vram28 | 0b01;
		PageModeTIM.vram29 = PageModeTIM.vram29 | 0b01;
		PageModeTIM.vram30 = PageModeTIM.vram30 | 0b01;
		PageModeTIM.vram31 = PageModeTIM.vram31 | 0b01;
		break;
	}
	variable_instance_set(vram28_grid_button, "toggle", grid_mode);
	variable_instance_set(vram29_grid_button, "toggle", grid_mode);
	variable_instance_set(vram30_grid_button, "toggle", grid_mode);
	variable_instance_set(vram31_grid_button, "toggle", grid_mode);
	
	png_out_success = false;
	png_duplicate = 0;
	obj_out_success = false;
	obj_duplicate = 0;
}