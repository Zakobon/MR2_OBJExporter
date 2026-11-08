/// @desc Aligns the imported TMD's UV data to the coords of the TIMBuilder's output.
/// Needs both a TEX and a MM0 file to work.
/// Saves the new data to a tmd_ clone called timb_tmd.
function timb_prim() {
		max_w = 0;
		max_h = 0;	
		num_rows = ceil(sqrt(ds_list_size(tim_list))); //number of TIM rows/columns of new png
		
		tim_offset = [];
		//MMX/MMJ check
		//This is a fix for the duplicate/erased prims issue
		switch(array_length(tmd_edit.objects)){
			case 0://MMX
			timb_tmd = variable_clone(tmd_reverse);
			break;
			default://MMJ
			timb_tmd = variable_clone(tmd_edit);
			break;
		}
		
		timb_groups = [];

		for (var a = 0; a < ds_list_size(tim_list);a++){
			switch(tim_list[|a].bit){
				case 0:
				b_mult = 4;
				break;
				case 1:
				b_mult = 2;
				break;
			}
			w = tim_list[|a].pixel_w * b_mult
			h = tim_list[|a].pixel_h;
			if (w > max_w){
				max_w = w;
			}
			if (h > max_h){
				max_h = h;
			}
		}
		for (var a = 0; a < array_length(timb_tmd.prim); a++){
			for (var b = 0; b < ds_list_size(tim_list); b++){
				array_push(timb_groups, [])
				if (tim_list[|b].bit != timb_tmd.prim[a].c_mode){
					continue;
				}
				
				switch (tim_list[|b].bit){
					case 0:
					mult = 4;
					break;
				
					case 1:
					mult = 2;
					break;
				}

				prim_x = timb_tmd.prim[a].center_xy[0] div mult;			
				prim_x += .5; //Sub-pixel centering, mimics PSX behavior
				
				page = tim_list[|b].pixel_x div 64; 
				
				//Check if both assets share the same VRAM page
				if (timb_tmd.prim[a].page_x != page){
					continue;
				}
				pix_x = tim_list[|b].pixel_x_origin;
				pix_w = pix_x + (tim_list[|b].pixel_w);
				tim_x = tim_list[|b].pixel_x mod 64;
				tim_w = tim_x + tim_list[|b].pixel_w;
				
				if (prim_x < tim_x){
					continue;
				}
				if (prim_x > tim_w){
					continue;
				}
				
				prim_y = timb_tmd.prim[a].center_xy[1];		
				prim_y += .5; //Sub-pixel centering
				pix_y = tim_list[|b].pixel_y_origin;
				pix_h = pix_y + tim_list[|b].pixel_h;
				
				if (prim_y < pix_y){
					continue;
				}
				if (prim_y > pix_h){
					continue;
				}
				
				array_push(timb_groups[b], a);
				
				//Original TIM VRAM locations
				tim_x_off = tim_x * mult; 
				tim_y_off = tim_list[|b].pixel_y mod 256;
				//New TIM locations
				timb_x_off = (b mod num_rows) * max_w;
				timb_y_off = (b div num_rows) * max_h;
				
				//New UV placement based on TIMBuilder PNG's TIM placement
				for (var c = 0; c < array_length(timb_tmd.prim[a].tex_x); c++){
					timb_tmd.prim[a].tex_x[c] = timb_tmd.prim[a].tex_x[c] - tim_x_off + timb_x_off;
					timb_tmd.prim[a].tex_y[c] = timb_tmd.prim[a].tex_y[c] - tim_y_off + timb_y_off;
				}
			}
		}
}