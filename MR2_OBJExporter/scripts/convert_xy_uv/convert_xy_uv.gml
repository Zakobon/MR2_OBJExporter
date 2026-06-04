// Takes a given x or y coordinate(uint) and returns a 6 digit real to append to "0."
// Divides value 0-256 by 256
// evaluates between 0.0 - 1.0
// made for increased accuracy over just using floats
function convert_xy_uv(_value, _flip = 0){
	value = _value;
	flip = _flip;

	if (value > 255){
		value = 255;
	}
	if (value < 0){
		value = 0;
	}
	if (flip == 1){
		value = value - 128;  // center coordinate in 0 - 256 range
		value = ~value;      // mirror it in relation to center of range
		value += 128;        // return to original origin
	}
	divisor = 256;
	value = value * 1000000; 
	result = value / divisor;

	result = result + 2000; //center pixel alignment
	if (result > 999999){
		result = 999999;
	}
	result = string(ceil(result));
	for (var a = string_length(result); a < 6;){
		result = string_insert("0", result, 0);
		a = string_length(result);
	}
	return string(result);
}