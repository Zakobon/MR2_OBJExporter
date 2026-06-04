//Takes an integer, divides by 100 and returns a string formated for obj export
function str_obj_vert(_num){
	str = string(_num);
	if (_num < 0){
		str = string_delete(str, 0, 1);
	}
	len = string_length(str);
	if (len < 4){
		str0 = "0";
	}
	else{
		str0 = string_copy(str, 0, string_length(str) - 3)
	}
	str1 = string_copy(str, string_length(str) - 2, 3)
	if (_num == 0){
		str0 = "0";
		str1 = "0";
	}
	else{
		for (var a = 0; a < (3 - len); a++){
			str1 = string_insert("0", str1, 0);
		}
		for (var a = 0; a < len; a++){
			if (string_ends_with(str1, "0")){
				str1 = string_delete(str1, string_length(str1), 1);
			}
		}
	}
	if (_num < 0){
		str0 = string_insert("-", str0, 0);
	}
	return (str0 + "." + str1);
}