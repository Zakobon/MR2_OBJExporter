draw_set_halign(fa_left);
draw_set_colour($FFFFFFFF);
draw_text_transformed(MM0_fname.left + 6, MM0_fname.top + 4,string("Model: {0}", ui_name_mm0), .75, .75, 0);
switch(tex_hash != -1){
	case true:
	mm_str = "Ready to Export";
	idle_col = $98A84B;
	break;
	
	case false:
	mm_str = "TEX file missing"
	idle_col = $4B68A8;
	break;
}
if (instance_exists(GetModel)){
	draw_text_transformed(out_OBJ.left + 138, out_OBJ.top + 4,string("[OBJ+MTL]"), .5, .5, 0);
	switch (obj_out_success){
		case true:
		draw_set_colour($FFAAFFAA);
		if (obj_duplicate > 1){
			draw_text_transformed(out_OBJ.left + 138, out_OBJ.top + 16,string("Exported Successfully (x{0}){1}", obj_duplicate, huh[(obj_duplicate div 25) mod 5]), .5, .5, 0);
		}
		else{
			draw_text_transformed(out_OBJ.left + 138, out_OBJ.top + 16,string("Exported Successfully"), .5, .5, 0);
		}
		break;
		case false:
		draw_set_colour(idle_col);
		draw_text_transformed(out_OBJ.left + 138, out_OBJ.top + 16,string(mm_str), .5, .5, 0);
		break;
	}
}
