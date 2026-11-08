/// @desc Takes a given x or y coordinate(uint) and returns a 6 digit real to append to "0."
/// Divides x or y value by edge distance
/// evaluates between 0.0 - 1.0
/// returns result as a string
/// @arg {real} _value X/Y coord to convert
/// @arg {real} _edge H or W of the texture page in pixels
/// @arg {boolean} _flip Flag to flip origin of value [Default:false]
/// @return {string}
function convert_xy_uv(_value, _edge = 256, _flip = false){
	value = _value;
	divisor = _edge;
	flip = _flip;
	
	if (value > divisor - 1){
		value = divisor - 1;
	}
	if (value < 0){
		value = 0;
	}
	if (flip == true){
		value -= divisor div 2;  // center coordinate in 0 - 256 range
		value = ~value;      // mirror it in relation to center of range
		value += divisor div 2;        // return to original origin
	}
	value += .5;
	//value = value * 1000000; 
	result = value / divisor;
	//result = result + 2000; //center pixel alignment
	//if (result > 999999){
	//	result = 999999;
	//}
	result = string_format(result, 1, 8);
	//for (var a = string_length(result); a < 6;){
	//	result = string_insert("0", result, 0);
	//	a = string_length(result);
	//}
	return string(result);
}