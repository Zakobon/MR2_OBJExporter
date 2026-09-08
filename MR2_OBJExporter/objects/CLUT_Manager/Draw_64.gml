//if (surface_exists(draw_ui_clut)){
//	draw_surface(draw_ui_clut, x, y);
//}

draw_sprite_stretched(Menu_Box, 0, p28_Window.left, p28_Window.top + p28_Window.height, 1024 + 8, 32 + 4);
if !(surface_exists(surf)){
	surf = surface_create(256,2);
}
surface_set_target(surf);
draw_set_alpha(1);
for (var a = 0; a < 16; a++){
	draw_point_colour(a, 0, draw_flat4bit[a]);
}
for (var a = 0; a < 256; a++){
	draw_point_colour(a, 1, draw_flat8bit[a]);
}
surface_reset_target();
draw_surface_stretched(surf, p28_Window.left + 4, p28_Window.top + p28_Window.height + 4, 1024, 8);

if (sprite_exists(clut_sprite)){
	draw_sprite_stretched(clut_sprite, 0, p28_Window.left + 4, p28_Window.top + p28_Window.height + 4, 1024, 32);
}