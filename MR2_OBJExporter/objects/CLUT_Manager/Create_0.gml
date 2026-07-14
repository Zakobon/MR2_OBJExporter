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
//Background
$363643,
//Greyscale
$000000,
$434343,
$ECECEC,
//Reds
$5E2203,
$8A401B,
$B36740,
//Yellows
$5E5003,
$8A791B,
$B3A140,
//Purples
$2E1B5F,
$49347A,
$695797,
//Greens
$023F2B,
$125C44,
$2B775E
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
//Background
$363643,
//Greyscale
$000000,
$434343,
$ECECEC,
$797979,
$9C9C9C,
//Reds
$5E2203,
$8A401B,
$B36740,
$DD9773,
$FFCAAF,
//Yellows
$5E5003,
$8A791B,
$B3A140,
$DDCD73,
$FFF3AF,
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
$7BB1A1
];
#endregion