draw_set_halign(fa_left);
draw_set_colour($FFFFFFFF);
draw_text_transformed(MM0_fname.left + 6, MM0_fname.top + 4,string("Model: {0}", ui_name_mm0), .75, .75, 0);
if (instance_exists(GetModel)){
	switch (obj_out_success){
		case true:
		draw_set_colour($FFAAFFAA);
		draw_text_transformed(MM0_fname.left + 212, MM0_fname.top + 4,string("[OBJ+MTL] Exported Successfully"), .75, .75, 0);
		break;
		case false:
		draw_set_colour($FFFFFFFF);
		draw_text_transformed(MM0_fname.left + 212, MM0_fname.top + 4,string("[OBJ+MTL] Ready to Export"), .75, .75, 0);
		break;
	}
}
