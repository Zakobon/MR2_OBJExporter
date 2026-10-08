/// @desc Takes a 16-bit fixed point number and returns it as signed float in string format. Used for normals.
/// @arg {integer} Fixed_Point_16bit The fixed Point Number to convert
/// @return string
//need 1.0 check
function str_obj_norm(_num, _neg_flag){
	n_str = "";
	
	n_sign = (_num >> 15) & 0b1;
	
	if (_neg_flag = true){
		n_sign = !n_sign;
	}

	if (false){ //debug console print out
		var binary = "";
		//value = (_num & 0b0111_1111_1111_1111);

		value = int64(_num);
		dec_value = 0;
		dec_value2 = 1;
		//if (n_sign == 1){
		//	value = value & 0b0111_1111_1111_1111;
		//}
		for (var a = 0; a < 15; a++) {
			dec_value2 = dec_value2 / 2;
			if !(a mod 4){
				if (a != 0){
					binary = "_" + binary;
				}
			}
			bin_num = value mod 2;
			if (bin_num < 0){
				bin_num = bin_num * -1;
			}
			if (bin_num != 0){
				dec_value = dec_value + dec_value2;
			}
			binary = string(bin_num) + binary;
			value = floor(value / 2);
			
		}
		if (_num >> 15 == 1){
			binary = "1" + binary;
		}
		else{
			binary = "0" + binary;
		}
		n_int_sign = "";
		if (n_sign == 1){
			n_int_sign = "-";
		}
		show_debug_message(string("_num:{0} | binary:{1} | int:{2} | n_int:{3}{4}\n", _num, binary, (_num >> 1) & 0b111, n_int_sign, n_int))
	}

	n_dec_bin = _num & 0b1111_1111_1111;
	acc_adj = 1_000_000;
	n_str0 = (_num >> 12) & 0b111;
	if ((_num >> 15) & 0b1 == 1){
		n_str0 *= -1;
	}
	n_str1 = (n_dec_bin) / (4096);
	
	if (_neg_flag == 1){
		n_str0 *= -1;
	}
	if (n_str0 < 0){
		n_str2 = n_str0 - n_str1;
	}
	else{
		n_str2 = n_str0 + n_str1;
	}
	return (string_format(n_str2,2,10));
}