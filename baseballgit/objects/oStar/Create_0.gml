/*if instance_exists(eTransition)
{
	sprite_index = sStar1;
	image_alpha = 0.75;
}
else*/
{
	sprite_index = choose(sStar1,sStar1,sStar2,sStar2,sStar3);
	image_alpha = 1;
}

if sprite_index = sStar1
{
	vspeed = global.starspeed;
}

if sprite_index = sStar2
{
	vspeed = global.starspeed + (choose(5,10));
}

if sprite_index = sStar3
{
	vspeed = global.starspeed + (choose(15,20));
}

orgx = x;
shine = 0;
timer = 0;
orgspr = sprite_index;
//image_yscale = global.staryscale;