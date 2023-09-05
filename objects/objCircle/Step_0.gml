if(!objGame.pause){
if(object_exists(objBelt)){
var beltCurrent = instance_nearest(x,y,objBelt);
var beltCurrentSprite = object_get_sprite(beltCurrent)
var beltRandomPos_x = beltCurrent.x + randomPos + sprite_get_xoffset(beltCurrentSprite);
var beltRandomPos_y = beltCurrent.y + randomPos + sprite_get_yoffset(beltCurrentSprite);
if(place_meeting(x,y,beltCurrent) && beltCurrent.layer != layer_get_id("Moving")){
	//moves the circles along the belt; 1 is left, 2 is up, 3 is right, 4 is down
	switch(beltCurrent.dir){
		case 1: x -= (2/3);
			//centers the circle on to the belt in a random position, easing it into place
			if(beltRandomPos_y-(1/10) > y || y > beltRandomPos_y+(1/10)) y = (40*y + beltRandomPos_y)/41;
			break;
		case 2: y -= (2/3);
			if(beltRandomPos_x-(1/10) > x || x > beltRandomPos_x+(1/10)) x = (40*x + beltRandomPos_x)/41;
			break;
		case 3: x += (2/3);
			if(beltRandomPos_y-(1/10) > y || y > beltRandomPos_y+(1/10)) y = (40*y + beltRandomPos_y)/41;
			break;
		case 4: y += (2/3);
			if(beltRandomPos_x-(1/10) > x || x > beltRandomPos_x+(1/10)) x = (40*x + beltRandomPos_x)/41; 
			break;
	}
}
//deposits
var depositCurrent = instance_nearest(x,y,objDeposit)
if(place_meeting(x,y,depositCurrent) && depositCurrent.layer = layer_get_id("Belts")){
	x = (50*x + depositCurrent.x)/51;
	y = (50*y + depositCurrent.y)/51;
	depositing = true;
}
if(depositing == true){
image_xscale -= 0.02;
image_yscale -= 0.02;
if(image_xscale <= 0.02){
	if(depositCurrent.r == r && depositCurrent.g = g && depositCurrent.b == b) depositCurrent.deposited++;
	instance_destroy();
}
}

//determines the color of the circle
if(r == 0 && g == 0 && b == 0) {
	sprite_index = sprCircleBlack;
	image_blend = c_white;
}
else image_blend = make_color_rgb(r,g,b);
switch(colorr){
	case 0: r = 255; g = 0; b = 0;//red
		break;
	case 1: r = 0; g = 255; b = 0;//green
		break;
	case 2: r = 0; g = 0; b = 255;//blue
		break;
	case 3: r = 0; g = 255; b = 255;//cyan
		break;
	case 4: r = 255; g = 0; b = 255;//magenta
		break;
	case 5: r = 255; g = 255; b = 0;//yellow
		break;
}


//decreases the alpha of a circle if it falls off a belt
if(x == prev_x && y == prev_y) idleCount++;
else{
	idleCount = 0;
	if(image_alpha < 1) image_alpha += 1/20;
}
if(idleCount > 60){
	image_alpha = 1 - (idleCount-60)/20;
	if(image_alpha <= 0) instance_destroy();
}
prev_x = x;
prev_y = y;

//prevents the destruction of new circles
creationInvuln--;

}//end of the belt exists check
}//end of the pause bracket