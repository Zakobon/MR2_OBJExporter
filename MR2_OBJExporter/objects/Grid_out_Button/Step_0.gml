
#region Read Active Buttons
//var grid_button_active = variable_instance_get(grid_button, "active");

var grid_28_blended_active = variable_instance_get(grid_28_blended, "active");
var grid_28_zigzag_active = variable_instance_get(grid_28_zigzag, "active");
var grid_28_weave_active = variable_instance_get(grid_28_weave, "active");
var grid_28_tile_active = variable_instance_get(grid_28_tile, "active");

var grid_29_blended_active = variable_instance_get(grid_29_blended, "active");
var grid_29_zigzag_active = variable_instance_get(grid_29_zigzag, "active");
var grid_29_weave_active = variable_instance_get(grid_29_weave, "active");
var grid_29_tile_active = variable_instance_get(grid_29_tile, "active");

var grid_30_blended_active = variable_instance_get(grid_30_blended, "active");
var grid_30_zigzag_active = variable_instance_get(grid_30_zigzag, "active");
var grid_30_weave_active = variable_instance_get(grid_30_weave, "active");
var grid_30_tile_active = variable_instance_get(grid_30_tile, "active");

var grid_31_blended_active = variable_instance_get(grid_31_blended, "active");
var grid_31_zigzag_active = variable_instance_get(grid_31_zigzag, "active");
var grid_31_weave_active = variable_instance_get(grid_31_weave, "active");
var grid_31_tile_active = variable_instance_get(grid_31_tile, "active");

var vram28_grid_button_active = variable_instance_get(vram28_grid_button, "active");
var vram29_grid_button_active = variable_instance_get(vram29_grid_button, "active");
var vram30_grid_button_active = variable_instance_get(vram30_grid_button, "active");
var vram31_grid_button_active = variable_instance_get(vram31_grid_button, "active");

//var vram28_grid_button_toggle = variable_instance_get(vram28_grid_button, "toggle");
//var vram29_grid_button_toggle = variable_instance_get(vram29_grid_button, "toggle");
//var vram30_grid_button_toggle = variable_instance_get(vram30_grid_button, "toggle");
//var vram31_grid_button_toggle = variable_instance_get(vram31_grid_button, "toggle");
#endregion

#region Enable if Grid Mode is Available
if (grid_mode28[0] == 1){
	variable_instance_set(grid_28_blended, "enable", variable_instance_get(vram28_grid_button,"enable"));
	variable_instance_set(grid_28_zigzag, "enable", variable_instance_get(vram28_grid_button,"enable"));
	variable_instance_set(grid_28_weave, "enable", variable_instance_get(vram28_grid_button,"enable"));
	variable_instance_set(grid_28_tile, "enable", variable_instance_get(vram28_grid_button,"enable"));
}
else{
	variable_instance_set(grid_28_blended, "enable", 0);
	variable_instance_set(grid_28_zigzag, "enable", 0);
	variable_instance_set(grid_28_weave, "enable", 0);
	variable_instance_set(grid_28_tile, "enable", 0);
}

if (grid_mode29[0] == 1){
	variable_instance_set(grid_29_blended, "enable", variable_instance_get(vram29_grid_button,"enable"));
	variable_instance_set(grid_29_zigzag, "enable", variable_instance_get(vram29_grid_button,"enable"));
	variable_instance_set(grid_29_weave, "enable", variable_instance_get(vram29_grid_button,"enable"));
	variable_instance_set(grid_29_tile, "enable", variable_instance_get(vram29_grid_button,"enable"));
}
else{
	variable_instance_set(grid_29_blended, "enable", 0);
	variable_instance_set(grid_29_zigzag, "enable", 0);
	variable_instance_set(grid_29_weave, "enable", 0);
	variable_instance_set(grid_29_tile, "enable", 0);
}

if (grid_mode30[0] == 1){
	variable_instance_set(grid_30_blended, "enable", variable_instance_get(vram30_grid_button,"enable"));
	variable_instance_set(grid_30_zigzag, "enable", variable_instance_get(vram30_grid_button,"enable"));
	variable_instance_set(grid_30_weave, "enable", variable_instance_get(vram30_grid_button,"enable"));
	variable_instance_set(grid_30_tile, "enable", variable_instance_get(vram30_grid_button,"enable"));
}
else{
	variable_instance_set(grid_30_blended, "enable", 0);
	variable_instance_set(grid_30_zigzag, "enable", 0);
	variable_instance_set(grid_30_weave, "enable", 0);
	variable_instance_set(grid_30_tile, "enable", 0);
}

if (grid_mode31[0] == 1){
	variable_instance_set(grid_31_blended, "enable", variable_instance_get(vram31_grid_button,"enable"));
	variable_instance_set(grid_31_zigzag, "enable", variable_instance_get(vram31_grid_button,"enable"));
	variable_instance_set(grid_31_weave, "enable", variable_instance_get(vram31_grid_button,"enable"));
	variable_instance_set(grid_31_tile, "enable", variable_instance_get(vram31_grid_button,"enable"));
}
else{
	variable_instance_set(grid_31_blended, "enable", 0);
	variable_instance_set(grid_31_zigzag, "enable", 0);
	variable_instance_set(grid_31_weave, "enable", 0);
	variable_instance_set(grid_31_tile, "enable", 0);
}

#endregion
#region Grid Button Read
if (vram28_grid_button_active == 1){
	variable_instance_set(vram28_grid_button, "active", 0);
	switch (PageModeTIM.vram28 & 0b01){
		case 1:
		PageModeTIM.vram28 = PageModeTIM.vram28 & ~0b01;
		grid_mode28[0] = 0;
		toggle_off = true;
		break;
		
		case 0:
		PageModeTIM.vram28 = PageModeTIM.vram28 | 0b01;
		grid_mode28[0] = 1;
		toggle_on = true;
		break;
	}
	
}
if (vram29_grid_button_active == 1){
	variable_instance_set(vram29_grid_button, "active", 0);
	switch (PageModeTIM.vram29 & 0b01){
		case 1:
		PageModeTIM.vram29 = PageModeTIM.vram29 & ~0b01;
		grid_mode29[0] = 0;
		toggle_off = true;
		break;
		
		case 0:
		PageModeTIM.vram29 = PageModeTIM.vram29 | 0b01;
		grid_mode29[0] = 1;
		toggle_on = true;
		break;
	}
	
}
if (vram30_grid_button_active == 1){
	variable_instance_set(vram30_grid_button, "active", 0);
	switch (PageModeTIM.vram30 & 0b01){
		case 1:
		PageModeTIM.vram30 = PageModeTIM.vram30 & ~0b01;
		grid_mode30[0] = 0;
		toggle_off = true;
		break;
		
		case 0:
		PageModeTIM.vram30 = PageModeTIM.vram30 | 0b01;
		grid_mode30[0] = 1;
		toggle_on = true;
		break;
	}
	
}
if (vram31_grid_button_active == 1){
	variable_instance_set(vram31_grid_button, "active", 0);
	switch (PageModeTIM.vram31 & 0b01){
		case 1:
		PageModeTIM.vram31 = PageModeTIM.vram31 & ~0b01;
		grid_mode31[0] = 0;
		toggle_off = true;
		break;
		
		case 0:
		PageModeTIM.vram31 = PageModeTIM.vram31 | 0b01;
		grid_mode31[0] = 1;
		toggle_on = true;
		break;
	}
	
}
#endregion
#region Grid Pattern Button Read
if (grid_28_blended_active){
	variable_instance_set(grid_28_blended, "active", 0);
	grid_mode28[1] = 0;
}

if (grid_28_zigzag_active){
	variable_instance_set(grid_28_zigzag, "active", 0);
	grid_mode28[1] = 1;
	
}

if (grid_28_weave_active){
	variable_instance_set(grid_28_weave, "active", 0);
	grid_mode28[1] = 2;
	
}

if (grid_28_tile_active){
	variable_instance_set(grid_28_tile, "active", 0);
	grid_mode28[1] = 3;
	
}

if (grid_29_blended_active){
	variable_instance_set(grid_29_blended, "active", 0);
	grid_mode29[1] = 0;
	
}

if (grid_29_zigzag_active){
	variable_instance_set(grid_29_zigzag, "active", 0);
	grid_mode29[1] = 1;
	
}

if (grid_29_weave_active){
	variable_instance_set(grid_29_weave, "active", 0);
	grid_mode29[1] = 2;
	
}

if (grid_29_tile_active){
	variable_instance_set(grid_29_tile, "active", 0);
	grid_mode29[1] = 3;
	
}

if (grid_30_blended_active){
	variable_instance_set(grid_30_blended, "active", 0);
	grid_mode30[1] = 0;
	
}

if (grid_30_zigzag_active){
	variable_instance_set(grid_30_zigzag, "active", 0);
	grid_mode30[1] = 1;
	
}

if (grid_30_weave_active){
	variable_instance_set(grid_30_weave, "active", 0);
	grid_mode30[1] = 2;
	
}

if (grid_30_tile_active){
	variable_instance_set(grid_30_tile, "active", 0);
	grid_mode30[1] = 3;
	
}

if (grid_31_blended_active){
	variable_instance_set(grid_31_blended, "active", 0);
	grid_mode31[1] = 0;
	
}

if (grid_31_zigzag_active){
	variable_instance_set(grid_31_zigzag, "active", 0);
	grid_mode31[1] = 1;
	
}

if (grid_31_weave_active){
	variable_instance_set(grid_31_weave, "active", 0);
	grid_mode31[1] = 2;
	
}

if (grid_31_tile_active){
	variable_instance_set(grid_31_tile, "active", 0);
	grid_mode31[1] = 3;
	
}
#endregion
#region Sync Grid Button Toggles [disabled] <Off to trial OBJ selective grid export>
//if (toggle_off == true){
//	PageModeTIM.vram28 = PageModeTIM.vram28 & ~0b01;
//	PageModeTIM.vram29 = PageModeTIM.vram29 & ~0b01;
//	PageModeTIM.vram30 = PageModeTIM.vram30 & ~0b01;
//	PageModeTIM.vram31 = PageModeTIM.vram31 & ~0b01;
//	grid_mode28[0] = 0;
//	grid_mode29[0] = 0;
//	grid_mode30[0] = 0;
//	grid_mode31[0] = 0;
//	toggle_off = false
//	png_out_success = false;
//	png_duplicate = 0;
//	tex_out_success = false;
//	tex_duplicate = 0;
//	obj_out_success = false;
//	obj_duplicate = 0;
//}
//if (toggle_on == true){
//	PageModeTIM.vram28 = PageModeTIM.vram28 | 0b01;
//	PageModeTIM.vram29 = PageModeTIM.vram29 | 0b01;
//	PageModeTIM.vram30 = PageModeTIM.vram30 | 0b01;
//	PageModeTIM.vram31 = PageModeTIM.vram31 | 0b01;
//	grid_mode28[0] = 1;
//	grid_mode29[0] = 1;
//	grid_mode30[0] = 1;
//	grid_mode31[0] = 1;
//	toggle_on = false
//		png_out_success = false;
//	png_duplicate = 0;
//	tex_out_success = false;
//	tex_duplicate = 0;
//	obj_out_success = false;
//	obj_duplicate = 0;
//}
#endregion
//if grid mode not active, set toggles to pattern: -1(off)
//if (grid_mode28[0] == 0){
//	grid_mode28[1] = -1;
//}
//if (grid_mode29[0] == 0){
//	grid_mode29[1] = -1;
//}
//if (grid_mode30[0] == 0){
//	grid_mode30[1] = -1;
//}
//if (grid_mode31[0] == 0){
//	grid_mode31[1] = -1;
//}
//if (grid_button_active == 1){
//	variable_instance_set(grid_button, "active", 0);
	
//	grid_mode = !grid_mode;
	//switch (grid_mode){
	//	case 0:
	//	PageModeTIM.vram28 = PageModeTIM.vram28 & ~0b01;
	//	PageModeTIM.vram29 = PageModeTIM.vram29 & ~0b01;
	//	PageModeTIM.vram30 = PageModeTIM.vram30 & ~0b01;
	//	PageModeTIM.vram31 = PageModeTIM.vram31 & ~0b01;
	//	break;
	//	case 1:
	//	PageModeTIM.vram28 = PageModeTIM.vram28 | 0b01;
	//	PageModeTIM.vram29 = PageModeTIM.vram29 | 0b01;
	//	PageModeTIM.vram30 = PageModeTIM.vram30 | 0b01;
	//	PageModeTIM.vram31 = PageModeTIM.vram31 | 0b01;
	//	break;
	//}
	
	//png_out_success = false;
	//png_duplicate = 0;
	//tex_out_success = false;
	//tex_duplicate = 0;
	//obj_out_success = false;
	//obj_duplicate = 0;
//}
	
#region Grid Pattern Toggle Update
if (variable_instance_get(grid_28_blended, "enable") == 1){
	blended = 0;
	zigzag = 0;
	weave = 0;
	tile = 0;
	switch (grid_mode28[1]){
		case 0:
		blended = 1;
		break;
		
		case 1:
		zigzag = 1;
		break;
		
		case 2:
		weave = 1;
		break;
		
		case 3:
		tile = 1;
		break;
		
		default:
		break;
	}
	variable_instance_set(grid_28_blended, "toggle", blended);
	variable_instance_set(grid_28_zigzag, "toggle", zigzag);
	variable_instance_set(grid_28_weave, "toggle", weave);
	variable_instance_set(grid_28_tile, "toggle", tile);
}
else{
	variable_instance_set(grid_28_blended, "toggle", 0);
	variable_instance_set(grid_28_zigzag, "toggle", 0);
	variable_instance_set(grid_28_weave, "toggle", 0);
	variable_instance_set(grid_28_tile, "toggle", 0);
}

if (variable_instance_get(grid_29_blended, "enable") == 1){
	blended = 0;
	zigzag = 0;
	weave = 0;
	tile = 0;
	switch (grid_mode29[1]){
		case 0:
		blended = 1;
		break;

		case 1:
		zigzag = 1;
		break;
		
		case 2:
		weave = 1;
		break;
		
		case 3:
		tile = 1;
		break;
		
		default:
		break;
	}
	variable_instance_set(grid_29_blended, "toggle", blended);
	variable_instance_set(grid_29_zigzag, "toggle", zigzag);
	variable_instance_set(grid_29_weave, "toggle", weave);
	variable_instance_set(grid_29_tile, "toggle", tile);
}
else{
	variable_instance_set(grid_29_blended, "toggle", 0);
	variable_instance_set(grid_29_zigzag, "toggle", 0);
	variable_instance_set(grid_29_weave, "toggle", 0);
	variable_instance_set(grid_29_tile, "toggle", 0);
}

if (variable_instance_get(grid_30_blended, "enable") == 1){
	blended = 0;
	zigzag = 0;
	weave = 0;
	tile = 0;
	switch (grid_mode30[1]){
		case 0:
		blended = 1;
		break;

		case 1:
		zigzag = 1;
		break;
		
		case 2:
		weave = 1;
		break;
		
		case 3:
		tile = 1;
		break;
		
		default:
		break;
	}
	variable_instance_set(grid_30_blended, "toggle", blended);
	variable_instance_set(grid_30_zigzag, "toggle", zigzag);
	variable_instance_set(grid_30_weave, "toggle", weave);
	variable_instance_set(grid_30_tile, "toggle", tile);
}
else{
	variable_instance_set(grid_30_blended, "toggle", 0);
	variable_instance_set(grid_30_zigzag, "toggle", 0);
	variable_instance_set(grid_30_weave, "toggle", 0);
	variable_instance_set(grid_30_tile, "toggle", 0);
}

if (variable_instance_get(grid_31_blended, "enable") == 1){
	blended = 0;
	zigzag = 0;
	weave = 0;
	tile = 0;
	switch (grid_mode31[1]){
		case 0:
		blended = 1;
		break;

		case 1:
		zigzag = 1;
		break;
		
		case 2:
		weave = 1;
		break;
		
		case 3:
		tile = 1;
		break;
		
		default:
		break;
	}
	variable_instance_set(grid_31_blended, "toggle", blended);
	variable_instance_set(grid_31_zigzag, "toggle", zigzag);
	variable_instance_set(grid_31_weave, "toggle", weave);
	variable_instance_set(grid_31_tile, "toggle", tile);
}
else{
	variable_instance_set(grid_31_blended, "toggle", 0);
	variable_instance_set(grid_31_zigzag, "toggle", 0);
	variable_instance_set(grid_31_weave, "toggle", 0);
	variable_instance_set(grid_31_tile, "toggle", 0);
}
#endregion
