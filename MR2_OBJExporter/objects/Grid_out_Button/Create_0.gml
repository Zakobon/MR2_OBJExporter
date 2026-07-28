globalvar grid_mode;
grid_mode = 0;

globalvar grid_mode28; //[grid_mode active, pattern_index]
grid_mode28 = [0, 0];

globalvar grid_mode29;
grid_mode29 = [0, 1];

globalvar grid_mode30;
grid_mode30 = [0, 2];

globalvar grid_mode31;
grid_mode31 = [0, 3];
toggle_off = false;
toggle_on = false;
x_off = 60;

//grid_button = instance_create_layer(x, y, "UI_Draw", Select_Button_24x24);
//variable_instance_set(grid_button, "display", "Enable Grid Export");
//variable_instance_set(grid_button, "toggle_set", 1);

#region VRAM Page Grid Mode Buttons
grid_28_blended = instance_create_layer(p28_Window.left + x_off + 0, p28_Window.top - 32, "UI_Draw", Select_Button_16x16);
variable_instance_set(grid_28_blended, "display", "Blended");
variable_instance_set(grid_28_blended, "toggle_set", 1);
variable_instance_set(grid_28_blended, "image_index", 14);
variable_instance_set(grid_28_blended, "image", 14);

grid_28_zigzag = instance_create_layer(p28_Window.left + x_off + 51, p28_Window.top - 32, "UI_Draw", Select_Button_16x16);
variable_instance_set(grid_28_zigzag, "display", "Zig Zag");
variable_instance_set(grid_28_zigzag, "toggle_set", 1);
variable_instance_set(grid_28_zigzag, "image_index", 14);
variable_instance_set(grid_28_zigzag, "image", 14);

grid_28_weave = instance_create_layer(p28_Window.left + x_off + 99, p28_Window.top - 32, "UI_Draw", Select_Button_16x16);
variable_instance_set(grid_28_weave, "display", "Weave");
variable_instance_set(grid_28_weave, "toggle_set", 1);
variable_instance_set(grid_28_weave, "image_index", 14);
variable_instance_set(grid_28_weave, "image", 14);

grid_28_tile = instance_create_layer(p28_Window.left + x_off + 144, p28_Window.top - 32, "UI_Draw", Select_Button_16x16);
variable_instance_set(grid_28_tile, "display", "Tile");
variable_instance_set(grid_28_tile, "toggle_set", 1);
variable_instance_set(grid_28_tile, "image_index", 14);
variable_instance_set(grid_28_tile, "image", 14);

grid_29_blended = instance_create_layer(p29_Window.left + x_off + 0, p29_Window.top - 32, "UI_Draw", Select_Button_16x16);
variable_instance_set(grid_29_blended, "display", "Blended");
variable_instance_set(grid_29_blended, "toggle_set", 1);
variable_instance_set(grid_29_blended, "image_index", 14);
variable_instance_set(grid_29_blended, "image", 14);

grid_29_zigzag = instance_create_layer(p29_Window.left + x_off + 51, p29_Window.top - 32, "UI_Draw", Select_Button_16x16);
variable_instance_set(grid_29_zigzag, "display", "Zig Zag");
variable_instance_set(grid_29_zigzag, "toggle_set", 1);
variable_instance_set(grid_29_zigzag, "image_index", 14);
variable_instance_set(grid_29_zigzag, "image", 14);

grid_29_weave = instance_create_layer(p29_Window.left + x_off + 99, p29_Window.top - 32, "UI_Draw", Select_Button_16x16);
variable_instance_set(grid_29_weave, "display", "Weave");
variable_instance_set(grid_29_weave, "toggle_set", 1);
variable_instance_set(grid_29_weave, "image_index", 14);
variable_instance_set(grid_29_weave, "image", 14);

grid_29_tile = instance_create_layer(p29_Window.left + x_off + 144, p29_Window.top - 32, "UI_Draw", Select_Button_16x16);
variable_instance_set(grid_29_tile, "display", "Tile");
variable_instance_set(grid_29_tile, "toggle_set", 1);
variable_instance_set(grid_29_tile, "image_index", 14);
variable_instance_set(grid_29_tile, "image", 14);

grid_30_blended = instance_create_layer(p30_Window.left + x_off + 0, p30_Window.top - 32, "UI_Draw", Select_Button_16x16);
variable_instance_set(grid_30_blended, "display", "Blended");
variable_instance_set(grid_30_blended, "toggle_set", 1);
variable_instance_set(grid_30_blended, "image_index", 14);
variable_instance_set(grid_30_blended, "image", 14);

grid_30_zigzag = instance_create_layer(p30_Window.left + x_off + 51, p30_Window.top - 32, "UI_Draw", Select_Button_16x16);
variable_instance_set(grid_30_zigzag, "display", "Zig Zag");
variable_instance_set(grid_30_zigzag, "toggle_set", 1);
variable_instance_set(grid_30_zigzag, "image_index", 14);
variable_instance_set(grid_30_zigzag, "image", 14);

grid_30_weave = instance_create_layer(p30_Window.left + x_off + 99, p30_Window.top - 32, "UI_Draw", Select_Button_16x16);
variable_instance_set(grid_30_weave, "display", "Weave");
variable_instance_set(grid_30_weave, "toggle_set", 1);
variable_instance_set(grid_30_weave, "image_index", 14);
variable_instance_set(grid_30_weave, "image", 14);

grid_30_tile = instance_create_layer(p30_Window.left + x_off + 144, p30_Window.top - 32, "UI_Draw", Select_Button_16x16);
variable_instance_set(grid_30_tile, "display", "Tile");
variable_instance_set(grid_30_tile, "toggle_set", 1);
variable_instance_set(grid_30_tile, "image_index", 14);
variable_instance_set(grid_30_tile, "image", 14);

grid_31_blended = instance_create_layer(p31_Window.left + x_off + 0, p31_Window.top - 32, "UI_Draw", Select_Button_16x16);
variable_instance_set(grid_31_blended, "display", "Blended");
variable_instance_set(grid_31_blended, "toggle_set", 1);
variable_instance_set(grid_31_blended, "image_index", 14);
variable_instance_set(grid_31_blended, "image", 14);

grid_31_zigzag = instance_create_layer(p31_Window.left + x_off + 51, p31_Window.top - 32, "UI_Draw", Select_Button_16x16);
variable_instance_set(grid_31_zigzag, "display", "Zig Zag");
variable_instance_set(grid_31_zigzag, "toggle_set", 1);
variable_instance_set(grid_31_zigzag, "image_index", 14);
variable_instance_set(grid_31_zigzag, "image", 14);

grid_31_weave = instance_create_layer(p31_Window.left + x_off + 99, p31_Window.top - 32, "UI_Draw", Select_Button_16x16);
variable_instance_set(grid_31_weave, "display", "Weave");
variable_instance_set(grid_31_weave, "toggle_set", 1);
variable_instance_set(grid_31_weave, "image_index", 14);
variable_instance_set(grid_31_weave, "image", 14);

grid_31_tile = instance_create_layer(p31_Window.left + x_off + 144, p31_Window.top - 32, "UI_Draw", Select_Button_16x16);
variable_instance_set(grid_31_tile, "display", "Tile");
variable_instance_set(grid_31_tile, "toggle_set", 1);
variable_instance_set(grid_31_tile, "image_index", 14);
variable_instance_set(grid_31_tile, "image", 14);
#endregion