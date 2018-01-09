if timer <= 3 && timer >= 0
{
	shine = 1;
}
else
{
	shine = 0;
	if timer <= 0
	{
		timer = round(random_range(20,40));
	}
}

timer-=1;

if shine
{
	image_xscale = 1.5;
}
else
{
	image_xscale = 1;
}

if y > room_height + 30
{
	instance_destroy();
}

//parallax
if instance_exists(oPlayer)
{
	if sprite_index == sStar2 or sprite_index == sStar3 //only for big stars
	{
		if oPlayer.x < room_width * 0.5
		{
			x = orgx + (((room_width * 0.5) - oPlayer.x)*0.12); //the last number is the amount
		}

		if oPlayer.x > room_width * 0.5
		{
			x = orgx + ((((room_width) - oPlayer.x)-room_width*0.5)*0.12);
		}
	}
	else
	{
		if oPlayer.x < room_width * 0.5
		{
			x = orgx + (((room_width * 0.5) - oPlayer.x)*0.05); //the last number is the amount
		}

		if oPlayer.x > room_width * 0.5
		{
			x = orgx + ((((room_width) - oPlayer.x)-room_width*0.5)*0.05);
		}
	}
}

/*transitions and speed changes

if instance_exists(eTransition)
{
	if global.starspeed < 60
	{
		global.starspeed += 0.2;
		global.staryscale += 0.025;
	}
}
else*/
{
	if global.starspeed > 5
	{
		global.starspeed -= 0.2;
	}
	if global.staryscale > 1
	{
		global.staryscale -= 0.025;
	}
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

//image_yscale = global.staryscale; //yscale so it can be changed upon transition