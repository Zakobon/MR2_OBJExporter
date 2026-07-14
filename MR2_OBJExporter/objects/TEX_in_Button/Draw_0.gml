draw_set_halign(fa_left);
draw_set_colour($FFFFFFFF);
draw_text_transformed(TEX_fname.left + 6, TEX_fname.top + 4,string("Texture: {0}", ui_name_tex), .75, .75, 0);
switch (instance_exists(ImportTIM)){
	case true:
	draw_text_transformed(out_PNG.left + 144, out_PNG.top + 4,string("[PNGs]"), .5, .5, 0);
	switch (png_out_success){
		case true:
		draw_set_colour($FFAAFFAA);
		if (png_duplicate > 1){
			draw_text_transformed(out_PNG.left + 144, out_PNG.top + 16, string("Exported Successfully (x{0}){1}", png_duplicate, huh[(png_duplicate div 25) mod 5]), .5, .5, 0);
		}
		else{
			draw_text_transformed(out_PNG.left + 144, out_PNG.top + 16,string("Exported Successfully"), .5, .5, 0);
		}
		break;
		
		case false:
		draw_set_colour($FFFFFFFF);
		draw_text_transformed(out_PNG.left + 144, out_PNG.top + 16,string("Ready to Export"), .5, .5, 0);
		break;
	}
	break;
	
	case false:
	draw_set_colour($FFFFFFFF);
	switch (instance_exists(GetModel)){
		case true:
		draw_text_transformed(out_PNG.left + 144, out_PNG.top + 4,string("[PNGs]"), .5, .5, 0);
		draw_text_transformed(out_PNG.left + 144, out_PNG.top + 16,string("(Load a texture to have materials linked automatically with exported OBJ)"), .5, .5, 0);
		break;
		case false:
		break;
	}
	break;
}