draw_set_halign(fa_left);
draw_set_colour($FFFFFFFF);
if (instance_exists(ImportTIM) && grid_mode == true){
	draw_text_transformed(x + 144, y + 4,string("[TEX]"), .5, .5, 0);
	switch (tex_out_success){
		case true:
		draw_set_colour($FFAAFFAA);
		if (tex_duplicate > 1){
			draw_text_transformed(x + 144, y + 16,string("Exported Successfully (x{0}){1}", tex_duplicate, huh[(tex_duplicate div 25) mod 5]), .5, .5, 0);
		}
		else{
			draw_text_transformed(x + 144, y + 16,string("Exported Successfully"), .5, .5, 0);
		}
		break;
		case false:
		draw_set_colour($FFFFFFFF);
		draw_text_transformed(x + 144, y + 16,string("Ready to Export"), .5, .5, 0);
		break;
	}
}
