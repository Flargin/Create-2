if(mouse_check_button_pressed(mb_left) && place_meeting(x,y,objCursor)){
	hold = true;
}
else if(mouse_check_button_released(mb_left)){
	hold = false;
}
//holds the object on the cursor
if(hold = true){
	x = mouse_x;
	y = mouse_y;
	self.layer = layer_get_id("Moving");
}
else{
	self.layer = layer_get_id("Circles");
}

if(object_exists(objBelt)){
var beltCurrent = instance_nearest(x,y,objBelt);
var beltCurrentSprite = object_get_sprite(beltCurrent)
var beltRandomPos_x = beltCurrent.x + randomPos + sprite_get_xoffset(beltCurrentSprite);
var beltRandomPos_y = beltCurrent.y + randomPos + sprite_get_yoffset(beltCurrentSprite);
if(place_meeting(x,y,beltCurrent) && beltCurrent.layer = layer_get_id("Belts")){
	//moves the circles along the belt; 1 is left, 2 is up, 3 is right, 4 is down
	switch(beltCurrent.dir){
		case 1: x -= 1;
			//centers the circle on to the belt in a random position, easing it into place
			if(beltRandomPos_y-(1/10) > y || y > beltRandomPos_y+(1/10)) y = (50*y + beltRandomPos_y)/51;
			break;
		case 2: y -= (2/3);
			if(beltRandomPos_x-(1/10) > x || x > beltRandomPos_x+(1/10)) x = (50*x + beltRandomPos_x)/51;
			break;
		case 3: x += (2/3);
			if(beltRandomPos_y-(1/10) > y || y > beltRandomPos_y+(1/10)) y = (50*y + beltRandomPos_y)/51;
			break;
		case 4: y += (2/3);
			if(beltRandomPos_x-(1/10) > x || x > beltRandomPos_x+(1/10)) x = (50*x + beltRandomPos_x)/51; 
			break;
	}
}
}