image_angle = oPlayerlegs.image_angle;
x = oPlayerlegs.x + image_angle;
y = oPlayerlegs.y + 40 -(abs(image_angle));

/*making thrustdust
instance_create_depth(x,y+32,1,eThrustdust);