update = false; //if true, check global vram page checks

////Visibilty mode of VRAM Pages
//0bx1: (0 = Grid Off, 1 = Grid On)
//0b1x: (0 = 4-Bit,    1 = 8-Bit)
globalvar PageModeTIM;
PageModeTIM = { 
	vram28 : 0,
	vram29 : 0,
	vram30 : 0,
	vram31 : 0
}

check28_4bit = false;
check29_4bit = false;
check30_4bit = false;
check31_4bit = false;
	
check28_8bit = false
check29_8bit = false;
check30_8bit = false;
check31_8bit = false;
	
//semi_transparency = instance_create_layer(x, y, "UI_Draw", Select_Button_24x24);
//variable_instance_set(semi_transparency, "display", "View Semi-Transparency");
//variable_instance_set(semi_transparency, "enable", 0);
//variable_instance_set(semi_transparency, "image", 0);
//variable_instance_set(semi_transparency, "toggle_set", 2);

//transparency = instance_create_layer(x, y + 32, "UI_Draw", Select_Button_24x24);
//variable_instance_set(transparency, "display", "View Transparency");
//variable_instance_set(transparency, "enable", 0);
//variable_instance_set(transparency, "image", 0);
//variable_instance_set(transparency, "toggle_set", 2);
//variable_instance_set(transparency, "toggle", 1);

#region VRAM 4-Bit Buttons
vram28_4bit_button = instance_create_layer(p28_Window.left + p28_Window.width - 70, p28_Window.top - 16, "UI_Draw", Select_Button_16x16);
variable_instance_set(vram28_4bit_button, "display", "4-bit")
variable_instance_set(vram28_4bit_button, "image_index", 14);
variable_instance_set(vram28_4bit_button, "image", 14);
variable_instance_set(vram28_4bit_button, "enable", 0);
variable_instance_set(vram28_4bit_button, "toggle_set", 2);

vram29_4bit_button = instance_create_layer(p29_Window.left + p29_Window.width - 70, p29_Window.top - 16, "UI_Draw", Select_Button_16x16);
variable_instance_set(vram29_4bit_button, "display", "4-bit")
variable_instance_set(vram29_4bit_button, "image_index", 14);
variable_instance_set(vram29_4bit_button, "image", 14);
variable_instance_set(vram29_4bit_button, "enable", 0);
variable_instance_set(vram29_4bit_button, "toggle_set", 2);

vram30_4bit_button = instance_create_layer(p30_Window.left + p30_Window.width - 70, p30_Window.top - 16, "UI_Draw", Select_Button_16x16);
variable_instance_set(vram30_4bit_button, "display", "4-bit")
variable_instance_set(vram30_4bit_button, "image_index", 14);
variable_instance_set(vram30_4bit_button, "image", 14);
variable_instance_set(vram30_4bit_button, "enable", 0);
variable_instance_set(vram30_4bit_button, "toggle_set", 2);

vram31_4bit_button = instance_create_layer(p31_Window.left + p31_Window.width - 70, p31_Window.top - 16, "UI_Draw", Select_Button_16x16);
variable_instance_set(vram31_4bit_button, "display", "4-bit")
variable_instance_set(vram31_4bit_button, "image_index", 14);
variable_instance_set(vram31_4bit_button, "image", 14);
variable_instance_set(vram31_4bit_button, "enable", 0);
variable_instance_set(vram31_4bit_button, "toggle_set", 2);
#endregion

#region VRAM 8-Bit Buttons
vram28_8bit_button = instance_create_layer(p28_Window.left + p28_Window.width - 34, p28_Window.top - 16, "UI_Draw", Select_Button_16x16);
variable_instance_set(vram28_8bit_button, "display", "8-bit")
variable_instance_set(vram28_8bit_button, "image_index", 14);
variable_instance_set(vram28_8bit_button, "image", 14);
variable_instance_set(vram28_8bit_button, "enable", 0);
variable_instance_set(vram28_8bit_button, "toggle_set", 2);

vram29_8bit_button = instance_create_layer(p29_Window.left + p29_Window.width - 34, p29_Window.top - 16, "UI_Draw", Select_Button_16x16);
variable_instance_set(vram29_8bit_button, "display", "8-bit")
variable_instance_set(vram29_8bit_button, "image_index", 14);
variable_instance_set(vram29_8bit_button, "image", 14);
variable_instance_set(vram29_8bit_button, "enable", 0);
variable_instance_set(vram29_8bit_button, "toggle_set", 2);

vram30_8bit_button = instance_create_layer(p30_Window.left + p30_Window.width - 34, p30_Window.top - 16, "UI_Draw", Select_Button_16x16);
variable_instance_set(vram30_8bit_button, "display", "8-bit")
variable_instance_set(vram30_8bit_button, "image_index", 14);
variable_instance_set(vram30_8bit_button, "image", 14);
variable_instance_set(vram30_8bit_button, "enable", 0);
variable_instance_set(vram30_8bit_button, "toggle_set", 2);

vram31_8bit_button = instance_create_layer(p31_Window.left + p31_Window.width - 34, p31_Window.top - 16, "UI_Draw", Select_Button_16x16);
variable_instance_set(vram31_8bit_button, "display", "8-bit")
variable_instance_set(vram31_8bit_button, "image_index", 14);
variable_instance_set(vram31_8bit_button, "image", 14);
variable_instance_set(vram31_8bit_button, "enable", 0);
variable_instance_set(vram31_8bit_button, "toggle_set", 2);
#endregion

#region VRAM Grid Buttons
globalvar vram28_grid_button;
vram28_grid_button = instance_create_layer(p28_Window.left + p28_Window.width - 65, p28_Window.top - 32, "UI_Draw", Select_Button_16x16);
variable_instance_set(vram28_grid_button, "display", "Grid View")
variable_instance_set(vram28_grid_button, "image_index", 14);
variable_instance_set(vram28_grid_button, "image", 14);
variable_instance_set(vram28_grid_button, "enable", 0);
variable_instance_set(vram28_grid_button, "toggle_set", 2);

globalvar vram29_grid_button;
vram29_grid_button = instance_create_layer(p29_Window.left + p29_Window.width - 65, p29_Window.top - 32, "UI_Draw", Select_Button_16x16);
variable_instance_set(vram29_grid_button, "display", "Grid View")
variable_instance_set(vram29_grid_button, "image_index", 14);
variable_instance_set(vram29_grid_button, "image", 14);
variable_instance_set(vram29_grid_button, "enable", 0);
variable_instance_set(vram29_grid_button, "toggle_set", 2);

globalvar vram30_grid_button;
vram30_grid_button = instance_create_layer(p30_Window.left + p30_Window.width - 65, p30_Window.top - 32, "UI_Draw", Select_Button_16x16);
variable_instance_set(vram30_grid_button, "display", "Grid View")
variable_instance_set(vram30_grid_button, "image_index", 14);
variable_instance_set(vram30_grid_button, "image", 14);
variable_instance_set(vram30_grid_button, "enable", 0);
variable_instance_set(vram30_grid_button, "toggle_set", 2);

globalvar vram31_grid_button;
vram31_grid_button = instance_create_layer(p31_Window.left + p31_Window.width - 65, p31_Window.top - 32, "UI_Draw", Select_Button_16x16);
variable_instance_set(vram31_grid_button, "display", "Grid View")
variable_instance_set(vram31_grid_button, "image_index", 14);
variable_instance_set(vram31_grid_button, "image", 14);
variable_instance_set(vram31_grid_button, "enable", 0);
variable_instance_set(vram31_grid_button, "toggle_set", 2);
#endregion