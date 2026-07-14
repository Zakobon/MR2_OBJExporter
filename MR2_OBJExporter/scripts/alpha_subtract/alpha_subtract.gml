/// @desc Apply alpha values from a mask surface to a targeted surface
/// @param {id.surface} target Surface that will inherit alpha values
/// @param {id.surface} mask Surface that will supply alpha values
/// @return {id.surface}

function alpha_subtract(_mask, _target){
		mask = sprite_create_from_surface(_mask, 0, 0, 256, 256, false, false, 0, 0);
		target = sprite_create_from_surface(_target, 0, 0, 256, 256, false, false, 0, 0);
	
		surface = surface_create(256, 256);
		surface_set_target(surface);
		
		draw_sprite(mask, 0, 0, 0);
		draw_sprite(target, 0, 0, 0);

		gpu_set_blendmode(bm_subtract);
		draw_set_alpha(1);
		draw_set_color(c_black);
		
		draw_rectangle(0, 0, 255, 255, false);
		gpu_set_blendmode(bm_add);
		
		draw_sprite_ext(mask, 0, 0, 0, 1, 1, 0, c_black, 1);		

		surface_reset_target();
		
		sprite_delete(mask);
		sprite_delete(target);
		gpu_set_blendmode(bm_normal);
		draw_set_color(c_white);
		return surface;
}