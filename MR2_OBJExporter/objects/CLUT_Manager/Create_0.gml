#region Grid CLUT values + Variable Declaration

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
//Greyscale
$000000,
$434343,
$ECECEC,
$797979,
$9C9C9C, //$A0A0A0
//Reds
$5E2203, //$602000
$8A401B, //$884018
$B36740, //$B06840
$DD9773, //$E09870
$FFCAAF, //1_$00C8B0 0h1_00C8B0
//Yellows
$5E5003, //$
$8A791B, //$
$B3A140, //$
$DDCD73, //$
$FFF3AF, //$
//Purples
$190941,
$2E1B5F,
$49347A, 
$695797,
$9283B6,
//Greens
$023F2B,
$125C44,
$2B775E,
$4E937C,
$7BB1A1,
//Background
$363643
];
#endregion
for (var a = 0; a < array_length(grid_data_clut4bit); a++){
	clut = convert_rgb_tim(grid_data_clut4bit[a], 1);
	rgb = make_colour_rgb(clut.blue * 8, clut.green * 8, clut.red * 8);
	grid_data_clut4bit[a] = rgb;
}

for (var a = 0; a < array_length(grid_data_clut8bit); a++){
	read = grid_data_clut8bit[a];
	clut = convert_rgb_tim(grid_data_clut8bit[a], 1);
	rgb = make_colour_rgb(clut.blue * 8, clut.green * 8, clut.red * 8);
	grid_data_clut8bit[a] = rgb;
}