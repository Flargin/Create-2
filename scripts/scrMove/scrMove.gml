function scrMove(){
if(place_meeting(x,y,objCursor) && mouse_check_button_pressed(mb_left)){
	hold = true;
}
else if(mouse_check_button_released(mb_left)) hold = false;

if(hold == true){
	self.layer = "Moving";
	x = mouse_x;
	y = mouse_y;
}
else{
	
}
}