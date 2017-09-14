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
if global.strikecount < 3
{
	draw_text_transformed(x,y-75,"STRIKE",size,size,random_range(-2,2));
	draw_text_transformed(x,y+75,global.strikecount,size,size,random_range(-2,2));
}
else
{
	draw_text_transformed(x,y-75,"YOU'RE",size,size,random_range(-2,2));
	draw_text_transformed(x,y+75,"OUT!!",size,size,random_range(-2,2));
}

timer -= 1

if timer <= 0
{
	if instance_exists(oEnemy) //destroys all balls on screen to give you a breather after a strike
	{
		with(oEnemy)
		{
			instance_create_depth(x,y,0,eExplosion);
			instance_destroy();
		}
	}
	instance_destroy();
}