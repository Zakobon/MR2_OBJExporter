#region Retrieve button status
//var semi_transparency_active = variable_instance_get(semi_transparency, "active");
//var transparency_active = variable_instance_get(transparency, "active");

//var semi_transparency_toggle = variable_instance_get(semi_transparency, "toggle");
//var transparency_toggle = variable_instance_get(transparency, "toggle");

var vram28_4bit_button_active = variable_instance_get(vram28_4bit_button, "active");
var vram29_4bit_button_active = variable_instance_get(vram29_4bit_button, "active");
var vram30_4bit_button_active = variable_instance_get(vram30_4bit_button, "active");
var vram31_4bit_button_active = variable_instance_get(vram31_4bit_button, "active");

var vram28_4bit_button_toggle = variable_instance_get(vram28_4bit_button, "toggle");
var vram29_4bit_button_toggle = variable_instance_get(vram29_4bit_button, "toggle");
var vram30_4bit_button_toggle = variable_instance_get(vram30_4bit_button, "toggle");
var vram31_4bit_button_toggle = variable_instance_get(vram31_4bit_button, "toggle");

var vram28_8bit_button_active = variable_instance_get(vram28_8bit_button, "active");
var vram29_8bit_button_active = variable_instance_get(vram29_8bit_button, "active");
var vram30_8bit_button_active = variable_instance_get(vram30_8bit_button, "active");
var vram31_8bit_button_active = variable_instance_get(vram31_8bit_button, "active");

var vram28_8bit_button_toggle = variable_instance_get(vram28_8bit_button, "toggle");
var vram29_8bit_button_toggle = variable_instance_get(vram29_8bit_button, "toggle");
var vram30_8bit_button_toggle = variable_instance_get(vram30_8bit_button, "toggle");
var vram31_8bit_button_toggle = variable_instance_get(vram31_8bit_button, "toggle");

var vram28_grid_button_active = variable_instance_get(vram28_grid_button, "active");
var vram29_grid_button_active = variable_instance_get(vram29_grid_button, "active");
var vram30_grid_button_active = variable_instance_get(vram30_grid_button, "active");
var vram31_grid_button_active = variable_instance_get(vram31_grid_button, "active");

var vram28_grid_button_toggle = variable_instance_get(vram28_grid_button, "toggle");
var vram29_grid_button_toggle = variable_instance_get(vram29_grid_button, "toggle");
var vram30_grid_button_toggle = variable_instance_get(vram30_grid_button, "toggle");
var vram31_grid_button_toggle = variable_instance_get(vram31_grid_button, "toggle");
#endregion

#region Check for Button Enable/Disable
if (update == true){
	update = false;
	
	check28_4bit = false; //Flag: True if 4bit or 8bit is found
	check29_4bit = false;
	check30_4bit = false;
	check31_4bit = false;
	
	check28_8bit = false; //Flag: True if 4bit or 8bit is found
	check29_8bit = false;
	check30_8bit = false;
	check31_8bit = false;
	
	for (var a = 0; a < array_length(draw_check28_8bit); a++){
		if (draw_check28_4bit[a] == true || prim_check28_4bit == true){
			variable_instance_set(vram28_4bit_button, "enable", 1);
			check28_4bit = true;
		}
		else{
			variable_instance_set(vram28_4bit_button, "enable", 0);
		}
		if (draw_check29_4bit[a] == true || prim_check29_4bit == true){
			variable_instance_set(vram29_4bit_button, "enable", 1);
			check29_4bit = true;
		}
		else{
			variable_instance_set(vram29_4bit_button, "enable", 0);
		}
		if (draw_check30_4bit[a] == true || prim_check30_4bit == true){
			variable_instance_set(vram30_4bit_button, "enable", 1);
			check30_4bit = true;
		}
		else{
			variable_instance_set(vram30_4bit_button, "enable", 0);
		}
		if (draw_check31_4bit[a] == true || prim_check31_4bit == true){
			variable_instance_set(vram31_4bit_button, "enable", 1);
			check31_4bit = true;
		}
		else{
			variable_instance_set(vram31_4bit_button, "enable", 0);
		}
	
		if (draw_check28_8bit[a] == true || prim_check28_8bit == true){
			variable_instance_set(vram28_8bit_button, "enable", 1);
			check28_8bit = true;
		}
		else{
			variable_instance_set(vram28_8bit_button, "enable", 0);
		}
		if (draw_check29_8bit[a] == true || prim_check29_8bit == true){
			variable_instance_set(vram29_8bit_button, "enable", 1);
			check29_8bit = true;
		}
		else{
			variable_instance_set(vram29_8bit_button, "enable", 0);
		}
		if (draw_check30_8bit[a] == true || prim_check30_8bit == true){
			variable_instance_set(vram30_8bit_button, "enable", 1);
			check30_8bit = true;
		}
		else{
			variable_instance_set(vram30_8bit_button, "enable", 0);
		}
		if (draw_check31_8bit[a] == true || prim_check31_8bit == true){
			variable_instance_set(vram31_8bit_button, "enable", 1);
			check31_8bit = true;
		}
		else{
			variable_instance_set(vram31_8bit_button, "enable", 0);
		}
	}
	if (instance_exists(ImportTIM)){
		if (check28_4bit || check28_8bit == true){
			variable_instance_set(vram28_grid_button, "enable", 1);
		}
		else {
			variable_instance_set(vram28_grid_button, "enable", 0);
		}
	
		if (check29_4bit || check29_8bit  == true){
			variable_instance_set(vram29_grid_button, "enable", 1);
		}
		else {
			variable_instance_set(vram29_grid_button, "enable", 0);
		}
	
		if (check30_4bit || check30_8bit  == true){
			variable_instance_set(vram30_grid_button, "enable", 1);
		}
		else {
			variable_instance_set(vram30_grid_button, "enable", 0);
		}
	
		if (check31_4bit || check31_8bit  == true){
			variable_instance_set(vram31_grid_button, "enable", 1);
		}
		else {
			variable_instance_set(vram31_grid_button, "enable", 0);
		}
	}
	if (check28_8bit){
		PageModeTIM.vram28 = PageModeTIM.vram28 | 0b10;
	}
	else{
		PageModeTIM.vram28 = PageModeTIM.vram28 & ~0b10;
	}
	if (check29_8bit){
		PageModeTIM.vram29 = PageModeTIM.vram29 | 0b10;
	}
	else{
		PageModeTIM.vram29 = PageModeTIM.vram29 & ~0b10;
	}
	if (check30_8bit){
		PageModeTIM.vram30 = PageModeTIM.vram30 | 0b10;
	}
	else{
		PageModeTIM.vram30 = PageModeTIM.vram30 & ~0b10;
	}
	if (check31_8bit){
		PageModeTIM.vram31 = PageModeTIM.vram31 | 0b10;
	}
	else{
		PageModeTIM.vram31 = PageModeTIM.vram31 & ~0b10;
	}
}
#endregion

#region Transparency Controls [Disabled]
//if (ds_list_size(tim_list) != 0){
//	variable_instance_set(semi_transparency, "enable", 1);
//	variable_instance_set(transparency, "enable", 1);
//}
//else{
//	variable_instance_set(semi_transparency, "enable", 0);
//	variable_instance_set(transparency, "enable", 0);
//}
//if (semi_transparency_active == 1){
//	view_semitransparency = semi_transparency_toggle;
//	variable_instance_set(semi_transparency, "active", 0);
//	draw_refresh = 1;
//}

//if (transparency_active == 1){
//	view_transparency = transparency_toggle;
//	variable_instance_set(transparency, "active", 0);
//	draw_refresh = 1;
//}
#endregion
#region View Grid Controls
if (vram28_grid_button_active == 1){
	variable_instance_set(vram28_grid_button, "active", 0);
	switch (PageModeTIM.vram28 & 0b01){
		case 0:
		//variable_instance_set(vram28_grid_button, "toggle", 1);
		PageModeTIM.vram28 = PageModeTIM.vram28 | 0b01;
		break;
		
		case 1:
		PageModeTIM.vram28 = PageModeTIM.vram28 & ~0b01;
		break;
	}
}
if (vram29_grid_button_active == 1){
	variable_instance_set(vram29_grid_button, "active", 0);
	switch (PageModeTIM.vram29 & 0b01){
		case 1:
		//variable_instance_set(vram29_grid_button, "toggle", 1);
		PageModeTIM.vram29 = PageModeTIM.vram29 & ~0b01;
		break;
		
		case 0:
		PageModeTIM.vram29 = PageModeTIM.vram29 | 0b01;
		break;
	}
}
if (vram30_grid_button_active == 1){
	variable_instance_set(vram30_grid_button, "active", 0);
	switch (PageModeTIM.vram30 & 0b01){
		case 1:
		//variable_instance_set(vram30_8bit_button, "toggle", 0);
		PageModeTIM.vram30 = PageModeTIM.vram30 & ~0b01;
		break;
		
		case 0:
		PageModeTIM.vram30 = PageModeTIM.vram30 | 0b01;
		break;
	}
}

if (vram31_grid_button_active == 1){
	variable_instance_set(vram31_grid_button, "active", 0);
	switch (PageModeTIM.vram31 & 0b01){
		case 1:
		//variable_instance_set(vram31_8bit_button, "toggle", 0);
		PageModeTIM.vram31 = PageModeTIM.vram31 & ~0b01;
		break;
		
		case 0:
		PageModeTIM.vram31 = PageModeTIM.vram31 | 0b01;
		break;
	}
}



#endregion

#region View Bit Controls
if (vram28_4bit_button_active == 1 || vram28_8bit_button_active == 1){
	variable_instance_set(vram28_4bit_button, "active", 0);
	variable_instance_set(vram28_8bit_button, "active", 0);
	switch (PageModeTIM.vram28 >> 1){
		case 0:
		if (check28_8bit == true){
			PageModeTIM.vram28 = PageModeTIM.vram28 | 0b10;
		}
		break;
		
		case 1:
		if (check28_4bit == true){
			PageModeTIM.vram28 = PageModeTIM.vram28 & ~0b10;
		}
		break;
	}
}
if (vram29_4bit_button_active == 1 || vram29_8bit_button_active == 1){
	variable_instance_set(vram29_4bit_button, "active", 0);
	variable_instance_set(vram29_8bit_button, "active", 0);
	switch (PageModeTIM.vram29 >> 1){
		case 0:
		if (check29_8bit == true){
			PageModeTIM.vram29 = PageModeTIM.vram29 | 0b10;
		}
		break;
		
		case 1:
		if (check29_4bit == true){
			PageModeTIM.vram29 = PageModeTIM.vram29 & ~0b10;
		}
		break;
	}
}
if (vram30_8bit_button_active == 1 || vram30_4bit_button_active == 1){
	variable_instance_set(vram30_4bit_button, "active", 0);
	variable_instance_set(vram30_8bit_button, "active", 0);
	switch (PageModeTIM.vram30 >> 1){
		case 0:
		if (check30_8bit == true){
			PageModeTIM.vram30 = PageModeTIM.vram30 | 0b10;
		}
		break;
		
		case 1:
		if (check30_4bit == true){
			PageModeTIM.vram30 = PageModeTIM.vram30 & ~0b10;
		}
		break;
	}
}

if (vram31_8bit_button_active == 1 || vram31_4bit_button_active == 1){
	variable_instance_set(vram31_4bit_button, "active", 0);
	variable_instance_set(vram31_8bit_button, "active", 0);
	switch (PageModeTIM.vram31 >> 1){
		case 0:
		if (check31_8bit == true){
			PageModeTIM.vram31 = PageModeTIM.vram31 | 0b10;
		}
		break;
		
		case 1:
		if (check31_4bit == true){
			PageModeTIM.vram31 = PageModeTIM.vram31 & ~0b10;
		}
		break;
	}
}
#endregion

#region Button Toggle Updates

if (check28_4bit == true || check28_8bit == true){
	variable_instance_set(vram28_grid_button, "toggle", PageModeTIM.vram28 & 0b01);
	switch (PageModeTIM.vram28 >> 1){
		case 0:
		variable_instance_set(vram28_4bit_button, "toggle", 1);
		variable_instance_set(vram28_8bit_button, "toggle", 0);
		break;
	
		case 1:
		variable_instance_set(vram28_4bit_button, "toggle", 0);
		variable_instance_set(vram28_8bit_button, "toggle", 1);	
		break;
	}
}
else {
	variable_instance_set(vram28_grid_button, "toggle", 0);
	variable_instance_set(vram28_8bit_button, "toggle", 0);
	variable_instance_set(vram28_4bit_button, "toggle", 0);
}

if (check29_4bit == true || check29_8bit == true){
	variable_instance_set(vram29_grid_button, "toggle", PageModeTIM.vram29 & 0b01);
	switch (PageModeTIM.vram29 >> 1){
		case 0:
		variable_instance_set(vram29_4bit_button, "toggle", 1);
		variable_instance_set(vram29_8bit_button, "toggle", 0);
		break;
	
		case 1:
		variable_instance_set(vram29_4bit_button, "toggle", 0);
		variable_instance_set(vram29_8bit_button, "toggle", 1);	
		break;
	}
}
else {
	variable_instance_set(vram29_grid_button, "toggle", 0);
	variable_instance_set(vram29_8bit_button, "toggle", 0);
	variable_instance_set(vram29_4bit_button, "toggle", 0);
}
if (check30_4bit == true || check30_8bit == true){
	variable_instance_set(vram30_grid_button, "toggle", PageModeTIM.vram30 & 0b01);
	switch (PageModeTIM.vram30 >> 1){
		case 0:
		variable_instance_set(vram30_4bit_button, "toggle", 1);
		variable_instance_set(vram30_8bit_button, "toggle", 0);
		break;
	
		case 1:
		variable_instance_set(vram30_4bit_button, "toggle", 0);
		variable_instance_set(vram30_8bit_button, "toggle", 1);	
		break;
	}
}
else {
	variable_instance_set(vram30_grid_button, "toggle", 0);
	variable_instance_set(vram30_8bit_button, "toggle", 0);
	variable_instance_set(vram30_4bit_button, "toggle", 0);
}
if (check31_4bit == true || check31_8bit == true){
	variable_instance_set(vram31_grid_button, "toggle", PageModeTIM.vram31 & 0b01);
	switch (PageModeTIM.vram31 >> 1){
		case 0:
		variable_instance_set(vram31_4bit_button, "toggle", 1);
		variable_instance_set(vram31_8bit_button, "toggle", 0);
		break;
	
		case 1:
		variable_instance_set(vram31_4bit_button, "toggle", 0);
		variable_instance_set(vram31_8bit_button, "toggle", 1);	
		break;
	}
}
else {
	variable_instance_set(vram31_grid_button, "toggle", 0);
	variable_instance_set(vram31_8bit_button, "toggle", 0);
	variable_instance_set(vram31_4bit_button, "toggle", 0);
}
#endregion