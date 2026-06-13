draw_set_halign(fa_left);
draw_set_colour($FFFFFFFF);
draw_text_transformed(TEX_fname.left + 6, TEX_fname.top + 4,string("Texture: {0}", ui_name_tex), .75, .75, 0);
switch (instance_exists(ImportTIM)){
	case true:
	switch (png_out_success){
		case true:
		draw_set_colour($FFAAFFAA);
		if (png_duplicate > 1){
			draw_text_transformed(TEX_fname.left + 212, TEX_fname.top + 4,string("[PNGs] Exported Successfully (x{0})", png_duplicate), .75, .75, 0);
		}
		else{
			draw_text_transformed(TEX_fname.left + 212, TEX_fname.top + 4,string("[PNGs] Exported Successfully"), .75, .75, 0);
		}
		break;
		
		case false:
		draw_set_colour($FFFFFFFF);
		draw_text_transformed(TEX_fname.left + 212, TEX_fname.top + 4,string("[PNGs] Ready to Export"), .75, .75, 0);
		break;
	}
	break;
	
	case false:
	draw_set_colour($FFFFFFFF);
	switch (instance_exists(GetModel)){
		case true:
		draw_text_transformed(TEX_fname.left + 212, TEX_fname.top + 4,string("(Load a texture to have materials linked automatically with exported OBJ)"), .75, .75, 0);
		break;
		case false:
		break;
	}
	break;
}