globalvar tim_list;
tim_list = ds_list_create();

globalvar tim_list_next; //tim_list of the next page
tim_list_next = ds_list_create();

globalvar draw_ui_clut; //draw surface for clut values
draw_ui_clut = -1;

globalvar draw_ui_tim; //draw surface of tims
draw_ui_tim = [];

globalvar png_out_success;
png_out_success = false;
//image_xscale = 4.2;

//ARAGON16 PALETTE
//Created by Space-AgeWrangler
//https://lospec.com/palette-list/aragon16
globalvar clut_4_default;
clut_4_default = [
[0xf9f8dd, 0],
[0xd2e291, 0],
[0xa8d455, 0],
[0x9cab6c, 0],
[0x5c8d58, 0],
[0x3b473c, 0],
[0x8b8893, 0],
[0x54555c, 0],
[0xe0bf7a, 0],
[0xba9572, 0],
[0x876661, 0],
[0x272120, 0],
[0xb7c4d0, 0],
[0x8daad6, 0],
[0x9197b6, 0],
[0x6b72d4, 0]
];
 
globalvar clut_8_default;
clut_8_default = [];

for (var a = 0; a < 256; a++){
	clut_8_default[a] = clut_4_default[a div 16];
}

function clut_data(_red, _green, _blue, _stp) constructor{
	red = _red;
	green = _green;
	blue = _blue;
	stp = _stp;
}

globalvar tim_rgb_8clut;
tim_rgb_8clut = [[], [], [], [], [], []]; //clut_y[clut_x] x = 0 for 8-bit
globalvar tim_rgb_4clut;
tim_rgb_4clut = [[], [], [], [], [], []];
globalvar tim_rgb_clut;
tim_rgb_clut = [[], [], [], [], [], []]; //clut_y[clut_x] x = 0 for 8-bit

globalvar tim_data_clut;
tim_data_clut = [];
image_index = 0;

clut_page_color = [
	$ffcfeae4,
	$ffb6d3cc,
	$ff9dbbb3,
	$ff84a39b,
	$ff6a8b82,
	$ff506962,
	$ff354641
];
//instance_create_layer(in_TIM.left + 144, in_TIM.top, "TIM_Draw", TEX_out_Button);





for (var a = 0; a < 7; a++){ //clut_y
	tim_rgb_8clut[a] = array_create(256, [0,0]); //[color, transparency]
	//tim_rgb_8clut[a][0x1][0] = clut_page_color[a];
}
for (var a = 0; a < 7; a++){ //clut_y
	for (var b = 0; b < 16; b++){ //clut_x
		tim_rgb_4clut[a] = array_create(16, [0,0]); //[color, transparency]
		//tim_rgb_8clut[a][b][0] = clut_page_color[a];
	}
}

for (var a = 0; a < 8; a++){ //clut_y
	
	for (var b = 0; b < 256; b++){
		
			
		cred = b * 2;
		cgreen = b * 2;
		cblue = b * 2;
		cstp = 0;
		dstp = cstp;
		
		dred = b * 16;
		dgreen = b * 16;
		dblue = b * 16;
		
		clut = new clut_data(cred % 16, cgreen % 16, cblue % 16, 0);
		tim_data_clut[a][b] = clut;
		
		tim_rgb_clut[a][b][0] = make_colour_rgb(dred % 256, dgreen % 256, dblue % 256);
		tim_rgb_clut[a][b][1] = dstp;
	}
}


import_tex = instance_create_layer(in_TIM.left, in_TIM.top, "UI_Draw", Select_Button_32x32);
variable_instance_set(import_tex, "image_index", 0);
variable_instance_set(import_tex, "display", "Import TEX");
variable_instance_set(import_tex, "image", 0);


exit;
instance_create_layer(x + 0, y + 45, "TIM_Draw", TIM_Import_Button);
instance_create_layer(x + 425, y, "TIM_Draw", TIM_Import_Group_Button);