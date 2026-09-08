#region Grid CLUT values + Variable Declaration
//grid color sequence
//c_seq[0] -> 4bit list
//c_seq[1] -> 8bit list

//c_seq[a][b] -> 0bxxxx_xxxx

//	0bxxxx_1111 = color index 1 
//	0b1111_xxxx = color index 2
globalvar c_seq; 
c_seq= c_index_builder(7, 15);
surf = -1;
// Lowest entry is darkest color in group
// 16 Entries:
// 0 = Black
// 1 = Grey
// 2 = White
// 3-5 = Reds
// 6-8 = Yellows
// 9-11 = Purples
// 12-14 = Greens
// 15 = Background
globalvar grid_data_clut4bit;
grid_data_clut4bit = [
//Greyscale
//opaque
$404040,
$606060,
$808080,
$A0A0A0,
$C0C0C0,
$E0E0E0,
$202020,
$000000, //Fully transparent pixel

//Semi Transparent
$404040,
$606060,
$808080,
$A0A0A0,
$C0C0C0,
$E0E0E0,
$202020,
$000000 //semi transparent black
];

//#region Old 4-bit CLUT
//if (false){
//	grid_data_clut4bit = [

//	//Reds
//	$5E1903,
//	$8A361B,
//	$D36740,


//	//Purples
//	$2E2B58,
//	$49347A,
//	$695797,
//	//Greens
//	$023F2B,
//	$125C44,
//	$2B775E,
//	//Yellows
//	$666603,
//	$888800,
//	$B3B500,
//	//Greyscale
//	$ECECEC,
//	$434343,
//	//Background
//	$00000F,
//	//Transparent
//	$000000
//	];
//}
//#endregion

// Lowest entry is darkest color in group
// 27 Entries:
// 0-5 = GreyScale
// 6-10 = Reds
// 11-15 = Yellows
// 16-20 = Purples
// 21-25 = Greens
// 26 = Background
globalvar grid_data_clut8bit; 
grid_data_clut8bit = [
//Reds
$5E1903,
$8A361B,
$D36740,

//Purples
$2E2B58,
$49347A,
$695797,
//Greens
$023F2B,
$125C44,
$2B775E,
//Yellows
$666603,
$888800,
$B3B500,
//Greyscale
$ECECEC,
$434343,
//Background
$00000F,
//Transparent
$000000
];
#endregion

//CLUT data for flat color mode
globalvar tex_flat4bit;
tex_flat4bit = [];
globalvar tex_flat8bit;
tex_flat8bit = [];
//rgb data for flat color mode
globalvar draw_flat4bit;
draw_flat4bit = [];
globalvar draw_flat8bit;
draw_flat8bit = [];

hue = 0;
sat = 255;
val = 255;
for (var a = 0; a < 16; a++){
	new_val = val - ((a mod 8) * 32);
	new_sat = 0;
	rgb = make_colour_hsv(hue, new_sat, new_val);
	clut = convert_rgb_tim(rgb, 1);
	if (a < 8){
		clut.stp = 0;
	}
	else{
		clut.stp = 1;
	}
	draw_flat4bit[a] = rgb;
	tex_flat4bit[a] = clut;
}
for (var a = 0; a < 256; a++){
	new_hue = ((a mod 128) * 8) mod 256;
	new_sat = (sat - (((a mod 128) div 16) * 16)) mod 256;
	rgb = make_colour_hsv(new_hue, (new_sat + 200) / 2 , new_sat);
	clut = convert_rgb_tim(rgb, 1);
	if (a < 128){ //splits CLUT in half for semi transparency
		clut.stp = 0;
	}
	else{
		clut.stp = 1;
	}

	draw_flat8bit[a] = rgb;
	tex_flat8bit[a] = clut;
}
#region //build grid_colors[] size = 60 //Not Used//

globalvar png_alpha; //controls alpha level of drawn vram pages, controled by UI buttons
png_alpha = .7;

hue = 0;
sat = 255;
val = 255;
count = 0;
repeat (60) {
	if (count > 11){
		count = 0;
		val -= 48;
		if (val < 96){
			val = 255;
			sat *= .7;
			if (sat < 0){
				sat = 255;
			}
		}
	}
	
	switch(count){ //hue selection
		case 0:
		hue = 0;
		sat2 = sat;
		val2 = val;
		break;
		
		case 1:
		hue = 20;
		sat2 = sat;
		val2 = val;
		break;
		
		case 2:
		hue = 26;
		sat2 = sat;
		val2 = val;
		break;
		
		case 3:
		hue = 32;
		sat2 = sat;
		val2 = val;
		break;
		
		case 4:
		hue = 40;
		sat2 = sat;
		val2 = val;
		break;
		
		case 5:
		hue = 64;
		sat2 = sat;
		val2 = val;
		break;
		
		case 6:
		hue = 106;
		sat2 = sat - 64;
		val2 = val * .8;
		break;
		
		case 7:
		hue = 128;
		sat2 = sat;
		val2 = val;
		break;
		
		case 8:
		hue = 144;
		sat2 = sat;
		val2 = val;
		break;
		
		case 9:
		hue = 160;
		sat2 = sat;
		val2 = val;
		break;
		
		case 10:
		hue = 192;
		sat2 = sat;
		val2 = val;
		break;
		
		case 11:
		hue = 205;
		sat2 = sat;
		val2 = val;
		break;
		
		case 12:
		hue = 224;
		sat2 = sat;
		val2 = val;
		break;

	}

	array_push(grid_colors, make_colour_hsv(hue,sat2,val2));
	hue += 8;
	count++;
}
	
#endregion
// grid_data_clut4bit or 8bit converted to clut data that Tex Files can use
globalvar tex_data_clut4bit;
tex_data_clut4bit = [];
globalvar tex_data_clut8bit;
tex_data_clut8bit = [];



for (var a = 0; a < array_length(grid_data_clut4bit); a++){
	clut = convert_rgb_tim(grid_data_clut4bit[a], 1);
	rgb = make_colour_rgb(clut.blue * 8, clut.green * 8, clut.red * 8);
	grid_data_clut4bit[a] = rgb;
}

for (var a = 0; a < array_length(grid_data_clut8bit); a++){
	clut = convert_rgb_tim(grid_data_clut8bit[a], 1);
	rgb = make_colour_rgb(clut.blue * 8, clut.green * 8, clut.red * 8);
	grid_data_clut8bit[a] = rgb;
	if (a < 128){
		clut.stp = 0;
	}
	else{
		clut.stp = 1;
	}
	tex_data_clut8bit[a] = clut;
}
	
for (var a = 0; a < 16; a++){
	clut = convert_rgb_tim(grid_data_clut4bit[a], 1);
	if (a < 8){
		clut.stp = 0;
	}
	else{
		clut.stp = 1;
	}
	tex_data_clut4bit[a] = clut;
}

for (var a = 0; a < 256; a++){
	if (a mod 128 < array_length(grid_data_clut8bit)){ //splits CLUT in half for semi transparency
		clut = convert_rgb_tim(grid_data_clut8bit[a mod 128], 1);
		if (a < 128){
			clut.stp = 0;//opaque
		}
		else{
			clut.stp = 1;//semi-transparent
		}
	}
	else{//if color index doesn't exist, black fill
		clut = {
			red : 0,
			green : 0,
			blue : 8,
			stp : 0
		}
	}
	tex_data_clut8bit[a] = clut;
}

