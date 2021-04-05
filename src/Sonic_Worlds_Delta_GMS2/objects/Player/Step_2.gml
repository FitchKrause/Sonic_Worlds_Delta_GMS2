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
			Xsp	+=	Dcc;
		}
		if(Xsp > 0 && Input.KeyLeft){
			Xsp	-=	Dcc;
		}
	}
	
	///Friction
	if(Ground){
		if(!Input.KeyLeft && !Input.KeyRight){
			Xsp	-=	min(abs(Xsp), Frc) * sign(Xsp);
			if(abs(Xsp) < 0.05){
				Xsp	=	0;
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
	
///Slopes Deceleration/Acceleration
if(Ground){
	if(Angle > 35 && Angle < 325){
		///Deceleration
		if(abs(Xsp) <= TopSp){
			Xsp	-=	dsin(Angle) * SlopeF;
		}
		
		///Acceleration
		if(abs(Xsp) > TopSp){
			Xsp	-=	dsin(Angle) * SlopeF;
		}
	}
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