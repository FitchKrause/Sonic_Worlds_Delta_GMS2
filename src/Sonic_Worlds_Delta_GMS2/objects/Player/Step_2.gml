///@description End Step Update

///Control X
	///Acceleration
	if(Ground){
		if(Xsp >= -TopSp && Input.KeyLeft){
			Xsp	-=	Acc;
		}
		if(Xsp <= TopSp && Input.KeyRight){
			Xsp	+=	Acc;
		}
	}
	
	///Acceleration in air
	if(!Ground){
		if(Xsp >= -TopSp && Input.KeyLeft){
			Xsp	-= AirAcc;
		}
		if(Xsp <= TopSp && Input.KeyRight){
			Xsp	+= AirAcc;
		}
	}
	
	///Deceleration
	if(Ground){
		if(Xsp < 0 && Input.KeyRight){
			Xsp	=	min(Xsp + Dcc, 0);
		}
		if(Xsp > 0 && Input.KeyLeft){
			Xsp	=	max(Xsp - Dcc, 0);
		}
	}
	
	///Friction
	if(Ground){
		if(Xsp < 0 && !Input.KeyLeft){
			Xsp	=	min(Xsp + Frc, 0);
		}
		if(Xsp > 0 && !Input.KeyRight){
			Xsp	=	max(Xsp - Frc, 0);
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
	///Gravitation
	if(!Ground){
		Ysp	+= Grv;
	}
	
	///Air Drag
	if(!Ground && (Ysp < 0 && Ysp > -4)){
		Xsp		-=	floor(Xsp / 0.125) / 256;
	}
	
	///Stop when player touch the ceil
	if(!Ground && Ysp < 0 && get_collision_sensor_top_big(player_collision_layer_list())){
		Ysp	=	0;
	}
	
	///Stop when player touch the floor
	if(Ground){
		Ysp	=	0;
	}