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
}//end of pause bracket