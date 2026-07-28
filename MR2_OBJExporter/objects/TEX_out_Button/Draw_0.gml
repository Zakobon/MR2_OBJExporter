draw_set_halign(fa_left);
draw_set_colour($FFFFFFFF);
//grid_check = grid_mode28[0] | grid_mode29[0] | grid_mode30[0] | grid_mode31[0];
if (instance_exists(ImportTIM)){
	draw_text_transformed(x + 178, y + 1,string("[TEX]"), .5, .5, 0);
	switch (tex_out_success){
		case true:
		draw_set_colour($FFAAFFAA);
		if (tex_duplicate > 1){
			draw_text_transformed(x + 178, y + 13,string("Exported Successfully (x{0}){1}", tex_duplicate, huh[(tex_duplicate div 25) mod 5]), .5, .5, 0);
		}
		else{
			draw_text_transformed(x + 178, y + 13,string("Exported Successfully"), .5, .5, 0);
		}
		break;
		case false:
		draw_set_colour($FFFFFFFF);
		draw_text_transformed(x + 178, y + 13,string("Ready to Export"), .5, .5, 0);
		break;
	}
}
