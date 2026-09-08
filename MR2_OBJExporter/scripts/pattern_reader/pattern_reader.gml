/// @desc Takes a sprite and returns an array of pixel arrays[real]
/// Returns sprite_data[frame][row][pixel, pixel, ...]
/// Values:
/// 0: Color 1
/// 1: Color 2
/// 2: Background
function pattern_reader(_sprite){
	draw_set_alpha(1);
	var sprite = sprite_get_info(_sprite);
	var width = sprite.width;
	var height = sprite.height;
	var pix = 0;
	var num_frames = array_length(sprite.frames);
	var sprite_data = [];
	var surf = surface_create(width, height);
	surface_set_target(surf);
	
	var array = [];
	for (var a = 0; a < num_frames; a++){
		sprite_data[a] = [];
		for (var b = 0; b < height; b++){
			sprite_data[a][b] = []
		}
	}
	for(var a = 0; a < num_frames; a++){ //repeat for every found frame
		var w = 0;
		var h = 0;
		draw_clear_alpha(c_black, 1);
		draw_sprite(_sprite, a, 0, 0);
		for (var b = 0; b < width * height; b++){ //read each pixel at every xy location
			if (w = width){
				w = 0;
				h++;
			}
			pix = surface_getpixel(surf, w, h);
			switch((pix >> 16) & 0b1111_1111){ //reads blue value, no need for the rest of the color data
				case 127://first color
				array_push(sprite_data[a][h], 0);
				break;
				
				case 255://second color
				array_push(sprite_data[a][h], 1);
				break;
				
				default://background color
				array_push(sprite_data[a][h], 2);
				break;
			}
			w++;
		}
	}
	surface_reset_target();
	surface_free(surf);
	return sprite_data;
}