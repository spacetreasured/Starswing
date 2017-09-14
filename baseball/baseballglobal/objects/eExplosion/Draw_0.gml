if timer > 6
{
	draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,c_black,1);
}

if timer == 6
{
	vspeed = 0;
	repeat 15
	{
		instance_create_depth(random_range(x-64,x+64),random_range(y-64,y+64),0,eDustExplosion);
	}
}

if timer < 6
{
	draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,c_white,1);
	instance_create_depth(x,y,0,eScreenshake);
}