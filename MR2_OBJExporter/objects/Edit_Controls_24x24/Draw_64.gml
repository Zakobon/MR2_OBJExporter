draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_alpha(1);
draw_set_colour(f_color);
draw_text_transformed(x + 0, y + y_off, string(display), .75, .75, 0);
draw_set_halign(fa_left);
//draw_sprite(Menu_Box,0,x,y) //Double checking for xy alignment