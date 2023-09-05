if(keyboard_check_pressed(vk_escape)){
	if(!pause){
		pause = true;
	} else{
		pause = false;
		instance_activate_all();
	}
}
//globalizes the animation of the belts
if(global.frameCount < 4 - (1/5)) global.frameCount += 1/5;
else global.frameCount = 0;