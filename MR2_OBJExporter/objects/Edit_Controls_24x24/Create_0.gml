//Centered on displayed string|          <<<"string">>>
//Expands out with x_off|        <<<(-x_off)"string"(+x_off)>>>

display = "X";
enable = 1;
create = 0;
timer = 0;

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