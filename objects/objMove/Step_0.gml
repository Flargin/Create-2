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
	x = mouse_x;
	y = mouse_y;
	self.layer = layer_get_id("Moving");
}
else{
	//snaps objects to a grid
	x = floor(x/64)*64+32;
	y = floor(y/64)*64+32;
	//moves object back to its previous location if it is place on top of another object
	if(place_meeting(x,y,objMove) && layer_has_instance("Moving", self)){
		x = previous_x;
		y = previous_y;
	}
	else if(x > room_width || x < 0 || y > room_height || y < 0){
		x = previous_x;
		y = previous_y;
	}
	self.layer = layer_get_id("Movables");
}
