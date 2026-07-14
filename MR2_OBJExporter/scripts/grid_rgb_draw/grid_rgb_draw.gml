/// @description Takes a color and returns the sprite of a colored grid
// {Asset.GMSprite} sprite Index of the sprite to draw behind grid
// {Real} subimg The subimg (frame) of the sprite to draw
/// @param {Real} w The width of the grid
/// @param {Real} h The height of the grid
/// @param {Constant.Color} color The color with which to blend the sprite with. c_white is to display it normally.
/// @param {Real} alpha The alpha of the sprite
/// @param {Real} [grid] Subimg of Grid1_256x256. The grid pattern to draw over sprite.
/// @return {Asset.GMSprite} New sprite asset
function grid_rgb_draw(_width, _height, _color, _alpha, _grid = 0){
	temp_surface = surface_create(_width, _height);
	new_sprite = -1;
	surface_set_target(temp_surface);
	draw_clear_alpha(c_white, 0);
	//draw_sprite_stretched_ext(_sprite, _subimg, 0, 0, _width, _height, c_white, _alpha);
	draw_sprite_ext(Grid1_256x256, _grid, 0, 0, 1, 1, 0, _color, _alpha);
	surface_reset_target();
    view_surface_id[0] = temp_surface;
	new_sprite = sprite_create_from_surface(temp_surface, 0, 0, _width, _height, false, false, 0, 0);
	surface_free(temp_surface);
	return new_sprite;
}