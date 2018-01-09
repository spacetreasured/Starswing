if timer <= 0
{
	/*if instance_exists(eTransition)
	{
		timer = 5;
	}
	else*/
	{
		timer = 20;
	}
	instance_create_depth(random_range(0,room_width),y,2,oStar);
}
else
{
	timer -= 1;
}