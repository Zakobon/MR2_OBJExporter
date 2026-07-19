var grid_button_active = variable_instance_get(grid_button, "active");
//if !(instance_exists(ImportTIM)){
//	variable_instance_set(grid_button, "enable", 0);
//}
//else{
//	variable_instance_set(grid_button, "enable", 1);
//}

if (grid_button_active == 1){
	variable_instance_set(grid_button, "active", 0);
	
	grid_mode = !grid_mode;
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
	
	png_out_success = false;
	png_duplicate = 0;
	tex_out_success = false;
	tex_duplicate = 0;
	obj_out_success = false;
	obj_duplicate = 0;
}