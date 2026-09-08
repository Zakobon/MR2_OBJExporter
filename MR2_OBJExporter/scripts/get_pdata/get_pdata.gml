/// @desc Takes a TIM and a sprite(stencil) and returns the stencil's pixel data as an array
/// @arg {asset.TIM} tim TIM to get parameters from
/// @arg {asset.sprite} sprite The sprite returned from sprite_builder_pattern(), which supplies the p_data
/// @return {array}
function get_pdata(_tim, _sprite){
	var surf = surface_create(2048, 256);
	surface_set_target(surf);
	draw_sprite(_sprite,0,0,0);//draw stencil sprite
	
	var bit = _tim.bit;
	var clut = -1;
	var tx = _tim.pixel_x - 768;
	var tp = tx div 64;
	var ty = _tim.pixel_y - 256;
	var tw = _tim.pixel_w;
	var th = _tim.pixel_h;
	var mult = 2;
		
	var pix = -1;
	var pix_array = [];
	
	switch (bit){
		case 0:
		mult = 4;
		clut = grid_data_clut4bit;
		break;
			
		case 1:
		mult = 2;
		clut = grid_data_clut8bit;
		tx += tp * 64;
		tx += 512;
		break;
	}
	
	tx *= mult;
	var w = 0;
	var h = 0;
	
	for (var b = 0; b < th * (tw * mult); b++){
		if (w >= (tw * mult)){
			w = 0;
			h++;
		}
		pix = surface_getpixel(surf, tx + w, ty + h) >> 16;
		w++;
		array_push(pix_array, pix);
	}
	
	surface_reset_target();
	surface_free(surf);
	return pix_array;
}