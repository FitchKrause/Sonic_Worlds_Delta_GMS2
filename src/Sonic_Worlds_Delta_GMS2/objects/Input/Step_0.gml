///@description Update
///Variables
if(FlagAllowInput){
	///Direction
	if(FlagAllowDirection){
		///Key Up
		if(keyboard_check(vk_up)){
			KeyUp			=	true;
		}else{
			KeyUp			=	false;
		}
		if(keyboard_check_pressed(vk_up)){
			KeyPressUp		=	true;
		}else{
			KeyPressUp		=	false;
		}
		
		///Key Down
		if(keyboard_check(vk_down)){
			KeyDown			=	true;
		}else{
			KeyDown			=	false;
		}
		if(keyboard_check_pressed(vk_down)){
			KeyPressDown	=	true;
		}else{
			KeyPressDown	=	false;
		}
		
		///Key Left
		if(keyboard_check(vk_left)){
			KeyLeft			=	true;
		}else{
			KeyLeft			=	false;
		}
		if(keyboard_check_pressed(vk_left)){
			KeyPressLeft	=	true;
		}else{
			KeyPressLeft	=	false;
		}
		
		///Key Right
		if(keyboard_check(vk_right)){
			KeyRight		=	true;
		}else{
			KeyRight		=	false;
		}
		if(keyboard_check_pressed(vk_right)){
			KeyPressRight	=	true;
		}else{
			KeyPressRight	=	false;
		}
	}else{
		KeyUp				=	false;
		KeyDown				=	false;
		KeyLeft				=	false;
		KeyRight			=	false;
		KeyPressUp			=	false;
		KeyPressDown		=	false;
		KeyPressLeft		=	false;
		KeyPressRight		=	false;
	}
	
	///Action
	if(FlagAllowAction){
		///Key A
		if(keyboard_check(ord("A"))){
			KeyA			=	true;
		}else{
			KeyA			=	false;
		}
		if(keyboard_check_pressed(ord("A"))){
			KeyPressA		=	true;
		}else{
			KeyPressUp		=	false;
		}
		
		///Key B
		if(keyboard_check(ord("S"))){
			KeyB			=	true;
		}else{
			KeyB			=	false;
		}
		if(keyboard_check_pressed(ord("S"))){
			KeyPressB		=	true;
		}else{
			KeyPressB		=	false;
		}
		
		///Key C
		if(keyboard_check(ord("D"))){
			KeyC			=	true;
		}else{
			KeyC			=	false;
		}
		if(keyboard_check_pressed(ord("D"))){
			KeyPressC		=	true;
		}else{
			KeyPressC		=	false;
		}
		
		///Key Action
		if(KeyA || KeyB || KeyC){
			KeyAction		=	true;
		}else{
			KeyAction		=	false;
		}
		if(KeyPressA || KeyPressB || KeyPressC){
			KeyPressAction	=	true;
		}else{
			KeyPressAction	=	false;
		}
	}else{
		KeyA				=	false;
		KeyB				=	false;
		KeyC				=	false;
		KeyAction			=	false;
		KeyPressA			=	false;
		KeyPressB			=	false;
		KeyPressC			=	false;
		KeyPressAction		=	false;
	}
	
	///Start
	if(FlagAllowStart){
		if(keyboard_check(vk_enter)){
			KeyStart		=	true;
		}else{
			KeyStart		=	false;
		}
		if(keyboard_check_pressed(vk_enter)){
			KeyPressStart	=	true;
		}else{
			KeyPressStart	=	false;
		}
	}else{
		KeyStart			=	false;
		KeyPressStart		=	false;
	}
}else{
	KeyUp					=	false;
	KeyDown					=	false;
	KeyLeft					=	false;
	KeyRight				=	false;
	KeyPressUp				=	false;
	KeyPressDown			=	false;
	KeyPressLeft			=	false;
	KeyPressRight			=	false;
	
	KeyA					=	false;
	KeyB					=	false;
	KeyC					=	false;
	KeyAction				=	false;
	KeyPressA				=	false;
	KeyPressB				=	false;
	KeyPressC				=	false;
	KeyPressAction			=	false;
}

///Fix Logic
	///Vertical
	if(KeyUp && KeyDown){
		KeyUp					=	false;
		KeyDown					=	false;
	}
	
	///Horizontal
	if(KeyLeft && KeyRight){
		KeyLeft					=	false;
		KeyRight				=	false;
	}