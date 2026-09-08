/// @desc Apply alpha values from a mask surface to a targeted surface
/// @param {id.surface} target Surface that will inherit alpha values
/// @param {id.surface} mask Surface that will supply alpha values
/// @return {id.surface}

function alpha_subtract(_mask, _target){
		var mask = sprite_create_from_surface(_mask, 0, 0, 256, 256, false, false, 0, 0);
		var target = sprite_create_from_surface(_target, 0, 0, 256, 256, false, false, 0, 0);
		draw_set_alpha(1);
		gpu_set_blendmode(bm_normal);
		var surface = surface_create(256, 256);
		surface_set_target(surface);
		

		
		//var old_gpu_colour = gpu_get_colourwriteenable();
		//gpu_set_colourwriteenable(true, true, true, false);
		//draw_sprite(target, 0, 0, 0);
		//gpu_set_colourwriteenable(false, false, false, true);
		//gpu_set_blendenable(false);
		//draw_sprite(mask, 0, 0, 0);
		//gpu_set_colourwriteenable(old_gpu_colour);
		//draw_sprite(target, 0, 0, 0);
		////gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_src_alpha, bm_inv_src_alpha);
		//gpu_set_colourwriteenable(false, false, false, true);
		//draw_sprite(mask, 0, 0, 0);
		//gpu_set_colourwriteenable(true, true, true, true);
		#region Test 0 [mild success]
		var old_gpu_colour = gpu_get_colourwriteenable();
		gpu_set_blendenable(false);
		draw_sprite(target, 0, 0, 0);
		gpu_set_colourwriteenable(false, false, false, true);
		gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_one, bm_dest_alpha, bm_zero);
		//gpu_set_blendmode(bm_min);
		draw_sprite(mask, 0, 0, 0);
		gpu_set_colourwriteenable(old_gpu_colour);
		gpu_set_blendmode_ext_sepalpha(bm_src_alpha, bm_inv_src_alpha, bm_src_alpha, bm_inv_src_alpha);
		#endregion
		#region Test 1
		//var _bm = gpu_get_blendmode_ext_sepalpha();
		//_bm[0] = bm_zero; 
		//_bm[1] = bm_src_alpha; 
		//_bm[2] = bm_inv_src_alpha; 
		//_bm[3] = bm_src_alpha;
		//gpu_set_blendmode_ext_sepalpha(_bm);
		#endregion
		#region Test 2
		//draw_sprite(target, 0, 0, 0);
		
		//gpu_set_blendmode(bm_subtract);
		
		//draw_set_color(c_black);
		
		//draw_rectangle(0, 0, 255, 255, false);
		//gpu_set_blendmode(bm_add);
		
		//draw_sprite_ext(mask, 0, 0, 0, 1, 1, 0, c_black, 1);		
		#endregion
		#region Test 4
		//sprite_set_alpha_from_sprite(target, mask);

		//draw_sprite(target, 0, 0, 0);
		#endregion
		
		
		gpu_set_blendmode(bm_normal);
		draw_set_color(c_white);
		surface_reset_target();
		sprite = sprite_create_from_surface(surface, 0, 0, 256, 256, false, false, 0, 0);
		gpu_set_blendenable(true);
		
		surface_free(surface);
		sprite_delete(mask);
		sprite_delete(target);
		return sprite;
}