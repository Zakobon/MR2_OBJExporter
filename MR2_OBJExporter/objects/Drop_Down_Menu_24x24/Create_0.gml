//Centered on displayed string|          <<<"string">>>
//Expands out with x_off|        <<<(-x_off)"string"(+x_off)>>>

display = "Null";
enable = 1;
create = 0;
timer = 0;
toggle = true;
m1_active = 0;
m2_active = 0;
m3_active = 0;
p1_active = 0;
p2_active = 0;
p3_active = 0;

f_color = $FFFFFFFF;
y_off = 4;
x_off = 4; //spacing meant for displayed text (4 for single char)
stages = 3; //Amount of additional arrows
destroy = false; //Destroys self along with all created instances
scale = .75;

draw_menu = false;

option_array = ["PNG:Polygon", "PNG:Flat", "TEX:Grid", "OBJ:Polygon"]; //maybe turn into a struct?

option = function(_display) constructor{
	static scale = .75;//Text/Button scale
	static w = string_width(_display) * 1; //Used for button width
	static h = string_height(_display) * 1;
	static total = 0; //Total number of buttons in menu
	display = _display; //Button text
	enable = false;
	total++;
}
menu = {
	active : false,
	draw : false,
	button : [],
};

active = false; //Signals all buttons that an option was selected
draw = false; //Displays Buttons

alarm[0] = 2; //delay building option buttons by two steps to allow definition by parent instance

export_menu = instance_create_layer(x, y, "UI_Draw", Select_Button_24x24);
variable_instance_set(export_menu, "display", string(display));
//variable_instance_set(export_menu, "image_alpha", 0);