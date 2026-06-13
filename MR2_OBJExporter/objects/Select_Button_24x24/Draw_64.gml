if (display != ""){
	text_width = string_width(display);
	if (string_width(display) < 8){
		text_width = 10;
	}
	image_xscale = 1 + (text_width / 32);
	text_x = (sprite_width / 2);
}
else{
	image_xscale = 1;
	text_x = 28;
}
if (display == ""){
	exit;
}

draw_set_halign(fa_center);
draw_set_valign(fa_center);


if (toggle == 1 && toggle_set == 1){
	//draw_set_colour($FF8D5F50);
	draw_set_colour(t_color_on0);
	draw_text_transformed(x + text_x, y + 13 + y_off, string(display), .75, .75, 0);
	draw_set_colour(t_color_on1);
	draw_text_transformed(x + text_x, y + 12 + y_off, string(display), .75, .75, 0);
}
else if (toggle_set == 1){
	draw_set_colour(t_color_off0);
	draw_text_transformed(x + text_x, y + 13 + y_off, string(display), .75, .75, 0);
	draw_set_colour(t_color_off1);
	draw_text_transformed(x + text_x, y + 12 + y_off, string(display), .75, .75, 0);
}
else {
	switch (enable){
		case 0:
		draw_set_colour($FF222222);
		draw_text_transformed(x + text_x, y + 12 + y_off, string(display), .75, .75, 0);
		break;
		
		case 1:
		draw_set_colour($FFCCCCCC);
		draw_text_transformed(x + text_x, y + 12 + y_off, string(display), .75, .75, 0);
		break;
	}
}
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour($FFCCCCCC);
if (enable == 0){
	image_index = image + 1;
	exit;
}
timer--;
if ((timer < 0) && !mouse_check_button(mb_left)){
	image_index = image;
	timer = 15;
}
