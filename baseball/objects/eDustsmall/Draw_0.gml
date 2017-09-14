if sprite_index != sDust1
{
	color = make_color_rgb(random_range(0,255),random_range(0,255),random_range(0,255));
}
else
{
	color = c_white;
}
draw_sprite_ext(sprite_index,0,x,y,1,1,0,color,1);