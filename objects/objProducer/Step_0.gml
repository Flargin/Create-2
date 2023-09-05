if(!objGame.pause){
//allows the object to be picked up from the creative menu
if(creationcd > 0){
	hold = true;
	creationcd--;
}
//makes sure that objects are only being moved if the left mouse button is pressed
if(mouse_check_button_pressed(mb_left) && place_meeting(x,y,objCursor)){
	hold = true;
	previous_x = x;
	previous_y = y;
}
else if(mouse_check_button_released(mb_left)){
	hold = false;
}
//holds the object on the cursor
if(hold = true){
	snap = false;
	x = mouse_x;
	y = mouse_y;
	self.layer = layer_get_id("Moving");
	if(keyboard_check_pressed(ord("R")) || mouse_check_button_pressed(mb_right)) dir++;
	if(dir > 4) dir = 1;
}
//checks to see if the object is being placed on another object
if(place_meeting(floor(x/64)*64+32, floor(y/64)*64+32, objMove)) snap = false;

//snaps objects to a grid
if(snap == true){
	previous_x = floor(x/64)*64+32;
	previous_y = floor(y/64)*64+32;
	self.layer = layer_get_id("Movables");
	snap = false;
	move = true;
}
//moves object back to its previous location if it is place on top of another object
else if(place_meeting(floor(x/64)*64+32, floor(y/64)*64+32, objMove) && layer_has_instance("Moving", self)){
	move = true;
}
else if(x > room_width || x < 0 || y > room_height || y < 0){
	move = true;
}
if(move == true && hold == false){
	if(x > previous_x + 1/2 || x < previous_x - 1/2) x = (x*5 + previous_x)/6;
	else moveCheck_x = true;
	if(y > previous_y + 1/2 || y < previous_y - 1/2) y = (y*5 + previous_y)/6;
	else moveCheck_y = true;
	
	if(moveCheck_x == true && moveCheck_y == true) move = false;
}
else{
	snap = true;
	moveCheck_x = false;
	moveCheck_y = false;
}

image_index = frameSet;
//changes the direction of the belt; 1 is left, 2 is up, 3 is right, 4 is down
switch(dir){
	case 1: frameSet = 0;
			if(place_meeting(x-64,y,objBelt) && instance_nearest(x-64,y,objBelt).layer != layer_get_id("Moving")) nextToBelt = true;
			else nextToBelt = false;
		break;
	case 2: frameSet = 1;
			if(place_meeting(x,y-64,objBelt) && instance_nearest(x,y-64,objBelt).layer != layer_get_id("Moving")) nextToBelt = true;
			else nextToBelt = false;
		break;
	case 3: frameSet = 2;
			if(place_meeting(x+64,y,objBelt) && instance_nearest(x+64,y,objBelt).layer != layer_get_id("Moving")) nextToBelt = true;
			else nextToBelt = false;
		break;
	case 4: frameSet = 3;
			if(place_meeting(x,y+64,objBelt) && instance_nearest(x,y+64,objBelt).layer != layer_get_id("Moving")) nextToBelt = true;
			else nextToBelt = false;
		break;
}

//creates a timer for producing circles
if(nextToBelt = true){
	c++;
	if(c >= 120 && self.layer != layer_get_id("Moving")){
		with instance_create_layer(x,y,"Circles", objCircle){
			colorr = other.colorr
		}
		c = 0;
	}
}
//debug
if(keyboard_check_pressed(ord("Q")) && place_meeting(x,y,objCursor)) colorr++;
if(colorr > 5) colorr = 0;

switch(colorr){
	case 0: sprite_index = sprProducerRed;
		break;
	case 1: sprite_index = sprProducerGreen;
		break;
	case 2: sprite_index = sprProducerBlue;
		break;
	case 3: sprite_index = sprProducerCyan;
		break;
	case 4: sprite_index = sprProducerMagenta;
		break;
	case 5: sprite_index = sprProducerYellow;
		break;
}
} // end of pause bracket