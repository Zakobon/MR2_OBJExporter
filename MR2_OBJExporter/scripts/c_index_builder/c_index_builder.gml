/// @desc Builds an index sequence for color pairs that avoids duplicates.
/// - 4bit sequence = array[0]
/// - 8bit sequence = array[1]
/// the returned array entries are in the form of:
/// - color index 1 = 0bxxxx_1111
/// - color index 2 = 0b1111_xxxx
/// -
/// index values will be [0-15]
/// @param {real} 4bit_cnum Max index for 4bit sequence| Default:7
/// @param {real} 8bit_cnum Max index for 8bit sequence| Default:15
/// @return Array

//Note: Can expand index cap from 0-15 to 0-255 for expanding 8bit's color range
//default sequence length for 4bit:    20 (# of colors:   7)
//default sequence length for 8bit:   104 (# of colors:  15)
//Maximum possible sequence length:   199 (# of colors:  16)
//[0-255]
//Maximum possible sequence length: 32384 (# of colors: 255)

//Note2: While 255 colors is possible, it's overkill
//	- It'd be better to just bump up the max to 16 as there isn't any TEX that comes close to
//  having 199 TIMs. 104? Possible, but not sure. 

//Note3: Thing get complicated for 4bit if you set it's cnum to 8
//	- index: 7 is reserved for fully transparent, 8 colors would mean you'd have to move it
//	to 4-bit's maximum index: 15
//	But since 8-14 is meant to be semi-transparent copies of 0-6, that leaves the
//	new maximum color index without a semi-transparent version; 7 + semi-offset(+8) = 15
//  instead it'll become fully transparent
//  so you'd have to either deal with patterns having giant holes in them, 
//  or mix the one opaque color with the semi transparent ones

function c_index_builder(_4bit_cnum = 7, _8bit_cnum = 15){
	var c_array = [[],[]];//[0b1111 + (0b1111 << 4)]
    

	var index = 0;
	var cap = 0;
	for (var i = 0; i < 2; ++i){
		var flag = true;
		switch(i){
			case 0:
			cap = _4bit_cnum;
			break;
			
			case 1:
			cap = _8bit_cnum;
			break;		
		}

		var c2 = 0;
		var c1 = 0; 
		//the last entry in the sequence will always be c1:cap - 1 & c2:cap - 2
		//example:
		//highest possible color index: 16
		//            |c2 |c1   |total |bit conversion
		//first entry: 00  01    [001]  0b0000_0001
		//last entry:  14  15    [239]  0b1110_1111
		var c1_max = cap - 1;
		var c2_max = cap - 2;
		
		while (flag == true){
			if (c2 == c2_max && c1 == c1_max){ //check for last entry in sequence
				flag = false;
			}
			else{
				c1++;
				if !(c1 mod cap){
					c2++;
					c1 = c2 + 1;// [= c2] to prevent repeats and [+ 1] to prevent duplicate index
				}
				index = (c2 << 4) | c1;
				
				array_push(c_array[i], index);
			}
		}
	}
	return c_array;
}