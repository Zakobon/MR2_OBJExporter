//Takes an integer, divides 4096 by it and returns a string
//need sign check
//need 1.0 check
function str_obj_norm(_num){
	num = _num & 0b1111_1111_1111;
	if (_num == 0){
		return "0.00000";
	}
	neg = (_num >> 15) & 0b1;
	num1 = num * 10000;
	num2 = 4096;
	result = ceil(num1 / num2);
	if (result == 1){
		switch (neg){
			case 0:
			return "1.00000";
			case 1:
			return "-1.00000";
		}
	}
	switch (neg){
		case 0:
		str0 = "0";
		break;
		
		case 1:
		str0 =  "-0";
		break;
	}
	str1 = string(result);
	len = string_length(str1);
	//if (_num == 0){
	//	str0 = "0";
	//	str1 = "0";
	//}
	//else{
		for (var a = 0; a < (5 - len); a++){
			str1 = string_insert("0", str1, 0);
		}
		for (var a = 0; a < len; a++){
			if (string_ends_with(str1, "0")){
				str1 = string_delete(str1, string_length(str1), 1);
			}
		}
	//}
	return (str0 + "." + str1);
}