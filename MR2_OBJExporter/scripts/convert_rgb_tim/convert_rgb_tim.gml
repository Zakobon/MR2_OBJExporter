/// @desc Converts the given color into it's individual RGB values and assigns them to a clut_data struct 
/// - If {R:<8 G:<8 B:<8 A:<.8} then returns Transparent Black{full} {R:0 G:0 B:0 STP:0}
/// - If {R:- G:- B:- A:<.8} then returns Semi Transparent {R:- G:- B:- STP:1}
/// - If {R:>8 G:0 B:0 A:>=.8} then returns Opaque Black{red} {R:1 G:0 B:0 STP:0}
/// - If {R:<B G:0 B:>8 A:>=.8} then returns Opaque Black{blue} {R:0 G:0 B:1 STP:0}
/// ]
/// ] Returns: {
///	]     red : 0b1111,      //Red
/// ]     green : 0b1111, //Green
/// ]     blue : 0b1111,    //Blue
/// ]     stp : 0b1              //Transparency Bit
/// ] }
/// @param {Color} color RGB Color Hex to convert
/// @param {Real} alpha Alpha value to convert into the stp bit
function convert_rgb_tim(_color, _alpha){
	clut_entry = {
		red : 0,
		green : 0,
		blue : 0,
		stp : 0
	}
	ired = colour_get_red(_color);
	igreen = colour_get_green(_color);
	iblue = colour_get_blue(_color);
	
	#region Prevent rounding overflow
	if (ired > 248){
		ired = 248;
	}
	if (igreen > 248){
		igreen = 248;
	}
	if (iblue > 248){
		iblue = 248;
	}
	#endregion
	
	if (_alpha < .8){
		ostp = 1;
	}
	else{
		ostp = 0;
	}
	//if (ired + igreen + iblue == 0 && _alpha < .8){ //check for full black transparency
	if (ired + igreen + iblue == 0){ //check for full black transparency
		clut_entry.red = 0;
		clut_entry.green = 0;
		clut_entry.blue = 0;
		clut_entry.stp = ostp;
		return clut_entry;
	}
	ored = round(ired / 8);
	ogreen = round(igreen / 8);
	oblue = round(iblue / 8);
	if (ored + ogreen + oblue + ostp == 0){ //check for converted black{full} opaque, if found adjust it to be black{red} or black{blue}
		if (ired > iblue){
			ored = 1;
		}
		else if (iblue > ired){
			oblue = 1;
		}
	}
	
	clut_entry.red = ored;
	clut_entry.green = ogreen;
	clut_entry.blue = oblue;
	clut_entry.stp = ostp;
	
	return clut_entry;
}