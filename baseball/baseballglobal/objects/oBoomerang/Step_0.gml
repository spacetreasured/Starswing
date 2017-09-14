if !global.freeze //----------------------------------------------------------------------------------------------------if you are not frozen
{

//destroy if off screen
if y > room_height+100
{
	instance_create_depth(room_width*0.5,room_height*0.5,-2,oStrike);
	instance_destroy();
}

//set turnspeed
image_angle += turnspeed;

if instance_exists(oBat)
{
	if place_meeting(x,y,oBat) && /*oBat.image_angle > 1 && oBat.image_angle < 179*/ oBat.swing == 1 //when you swing and hit the ball
	{
		instance_create_depth(x,y,0,eScreenshake);
		if hit!=1
		{
			hit = 1;
			global.freeze = 20;
			repeat 5
			{
				instance_create_depth(x,y,0,eDust);
			}
			if !instance_exists(oExclaim)
			{
				if x > room_width*0.5
				{
					instance_create_depth(x-200,y-100,depth,oExclaim);
				}
				else
				{
					instance_create_depth(x+200,y-100,depth,oExclaim);
				}
			}
			instance_create_depth(x,y,-1,eSmash);
		}
	}
}

//after freezing when hit back at enemies
if hit
{
	vspeed = hitspeed;
	turnspeed = hitspeed; //makes it so it spins out and then turns as it comes back
	if sprite_index != sBoomerang
	{
		sprite_index = sBoomerang;
	}
	
	if hitspeed < -1
	{
		hitspeed *= 0.8; //slows down vertical speed to boomerang back at you
		if hitspeed < -90 //only does trail when you hit it the first time, not when it boomerangs back
		{
			repeat 2
			{
				instance_create_depth(x,y,0,eDustsmall);
				instance_create_depth(x,y-50,0,eDustsmall);
				instance_create_depth(x,y+50,0,eDustsmall);
			}
		}
	}
	else
	{
		boomeranging = 1;
		if hitspeed < 100
		{
			hitspeed += 1; //speeds up to 100 to come at you
		}
	}
	
	if boomeranging
	{
		if place_meeting(x,y,oBat) && oBat.swing == 1 //when you swing and hit the ball while it's boomeranging
		{
			if !dead //if it isn't dead yet, make it "dead"
			{
				global.freeze = 10;
				dead = 1;
				instance_create_depth(x,y,-1,eSmash);
			}
		}	
	}
	
	//sprite_index = sBallhit;
	image_xscale = 1;
	image_yscale = 1;
}
else
{
	vspeed = startspeed;
	image_angle += turnspeed;
}

if dead && global.freeze <= 0 //if you've hit it twice, do this
{
	instance_create_depth(x,y,0,eExplosion);
	instance_destroy();
}

} //----------------------------------------------------------------------------------------------------end of no-freeze zone
else //if you *are* frozen
{
	if global.freeze > 0
    {
        image_speed = 0;
		vspeed = 0;
		if hit && !boomeranging//if this was the one hit
		{
			image_xscale *= 1.03;
			image_yscale = 0.75;
			sprite_index = sBall;
			image_angle = 0;
		}
		/*if hit && boomeranging
		{
			image_xscale += 0.1;
			image_yscale += 0.05;	
			image_angle = 0;
		}*/
    }
}