///@description End Step Update
///Key Direction
KeyXDir	=	Input.KeyRight - Input.KeyLeft;

///Control X
if(KeyXDir != 0){
	///Acceleration
	if(abs(Xsp) <= TopSp){
		if(Ground){
			///Ground Acceleration
			Xsp	+=	(Acc * KeyXDir);
		}else{
			///Air Acceleration
			Xsp	+=	(AirAcc * KeyXDir);
		}
	}
		
	///Ground Deceleration
	if(abs(Xsp) > 0 && KeyXDir != sign(Xsp)){
		if(Ground){
			Xsp -=	min(abs(Xsp), Dcc) * sign(Xsp);
		}
	}
}else{
	///Ground Friction
	if(abs(Xsp) > 0){
		if(Ground){
			Xsp -=	min(abs(Xsp), Frc) * sign(Xsp);
		}
	}
}
	
///Stop when player touch the walls
if(Xsp < 0 && get_collision_sensor_left_big(player_collision_layer_list())){
	Xsp		=	0;
}
if(Xsp > 0 && get_collision_sensor_right_big(player_collision_layer_list())){
	Xsp		=	0;
}

///Control Y
	///Y Ground Movement
	if(Ground){
		///Stop when player touch the floor
		Ysp	=	0;
	}
	
	///Y Air Movement
	if(!Ground){
		///Gravitattion
		Ysp	+= Grv;
		
		///Air Drag
		if(Ysp < 0 && Ysp > -4){
			Xsp		-=	floor(Xsp / 0.125) / 256;
		}
		
		///Stop when player touch the ceil
		if(Ysp <= 0 && get_collision_sensor_top_big(player_collision_layer_list())){
			Ysp	=	0;
		}
	}