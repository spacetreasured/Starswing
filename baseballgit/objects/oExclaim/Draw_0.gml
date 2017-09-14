if size > 1.5
{
	size *= 0.9;
	color = make_color_rgb(255,random_range(0,255),random_range(0,255));
}
else
{
	color = make_color_rgb(255,241,232);
}

vspeed *= 0.9;

draw_set_font(fTest);
draw_set_valign(fa_center);
draw_set_halign(fa_middle);
draw_set_color(color);
draw_text_transformed(x,y-75,"!?",size,size,random_range(-2,2));


timer -= 1

if timer <= 0
{
	/*repeat(10)
	{
		instance_create_depth(random_range(x-200,x+200),random_range(y-75,y+75),0,eDust);
	}*/
	instance_destroy();
}