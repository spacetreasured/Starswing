if timer > 6
{
	draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,c_red,1);
}

if timer < 6
{
	draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,c_white,1);
}