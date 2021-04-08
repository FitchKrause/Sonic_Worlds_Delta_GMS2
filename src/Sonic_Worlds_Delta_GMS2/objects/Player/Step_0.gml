///@description Step Update
///Start Movement
	///Limit Decimals
	Xsp		=	decimal_floor_to(Xsp, 10000);
	Ysp		=	decimal_floor_to(Ysp, 10000);
	Angle	=	decimal_floor_to(Angle, 10000);
	
	///Limit Speed
	Xsp	=	clamp(Xsp, -MaxSp, MaxSp);
	Ysp	=	clamp(Ysp, -MaxSp, MaxSp);
	
	///Deactivate Landing Flag
	Landed		=	false;
	
	///Ground Speed
	if(Ground){
		Gsp	=	Xsp;
	}
	
///X and Y Movement
	///X Movement
	if(FlagAllowX){
		PosX	+=	dcos(Angle) * Xsp;
		PosY	-=	dsin(Angle) * Xsp;
	}
	
	///Y Movement
	if(FlagAllowY && !Ground){
		PosY	+=	Ysp;
	}
	
///Collision
	///Horizontal Collision
	if(FlagAllowX){
		///Left
		while(Xsp < 0 && get_collision_sensor_left(player_collision_layer_list())){
			PosX	+=	dcos(Angle);
			PosY	-=	dsin(Angle);
		}
		
		///Right
		while(Xsp > 0 && get_collision_sensor_right(player_collision_layer_list())){
			PosX	-=	dcos(Angle);
			PosY	+=	dsin(Angle);
		}
	}
	
	///Vertical
	if(FlagAllowY && !Ground){
		///Top
		while(Ysp < 0 && get_collision_sensor_top(player_collision_layer_list())){
			PosY	++;
		}
		
		///Bottom
		while(Ysp > 0 && get_collision_sensor_bottom(player_collision_layer_list())){
			PosY	--;
		}
	}
	
///Land
if(FlagAllowLanding){
	///Set Grounding State
	if(Ysp >= 0 && !Ground && get_collision_sensor_bottom_big(player_collision_layer_list())){
		LandedSpeed	=	Ysp;
		Landed		=	true;
		Ground		=	true;
	}
	
	///Set Ceiling State
	if(Ysp <= 0 && !Ground && get_collision_sensor_top_big(player_collision_layer_list())){
		LandedSpeed	=	Ysp;
		Landed		=	true;
		Ground		=	true;
	}
}

///Landing
if(Landed){
	///Ground
	if(Ysp > 0){
		Angle			=	0;
		///Check both edges. If they collide, we can check angle.
		if(get_collision_sensor_edge_left(player_collision_layer_list()) || get_collision_sensor_edge_right(player_collision_layer_list())){
			Angle		=	player_get_angle();
		}

		///If the player is on ground, set Y Speed to 0.
		if(Ground){
			Ysp			=	0;
		}
		
		///Calculate Landing Speed.
		if(((Angle >= 22.5 && Angle <= 45) || (Angle >= 316 && Angle <= 337.5))){
			Xsp	=	-dsin(Angle) * (LandedSpeed * LandingCnvrF);
		}

		if(((Angle >= 45 && Angle <= 90) || (Angle >= 270 && Angle <= 315))){
			Xsp	=	-dsin(Angle) * LandedSpeed;
		}
	}else{
	///Ceil
		Angle			=	180;
		///Check both edges. If they collide, we can check angle.
		if(get_collision_sensor_edge_left(player_collision_layer_list()) || get_collision_sensor_edge_right(player_collision_layer_list())){
			Angle		=	player_get_angle();
		}
		
		///Calculate Landing Speed.
		if(Angle >= 135 && Angle <= 225){
			Xsp	=	-dsin(Angle) * (LandedSpeed * LandingCnvrF);
		}

		if(((Angle >= 90 && Angle <= 135) || (Angle >= 225 && Angle <= 270))){
			Xsp	=	-dsin(Angle) * LandedSpeed;
		}
	}
}

///Slopes.
if(Ground){
	///Slopes Down.
	while(!get_collision_sensor_main(player_collision_layer_list()) && get_collision_sensor_slopes(player_collision_layer_list())){
		PosX	+=	dsin(Angle);
		PosY	+=	dcos(Angle);
	}
		
	///Slopes Up.
	while(get_collision_sensor_main(player_collision_layer_list())){
		PosX	-=	dsin(Angle);
		PosY	-=	dcos(Angle);
	}
}
	
///Surface Angle Detection
	if(Ground && get_collision_sensor_bottom_big(player_collision_layer_list()) && 
	get_collision_sensor_edge_left(player_collision_layer_list()) && get_collision_sensor_edge_right(player_collision_layer_list())){
		Angle		=	player_get_angle();
	}

///Falling
	///Slow down when going uphill and speed up when going downhill (slope factor).
	if(Ground){
		Xsp	-=	SlopeF * dsin(Angle);
	}
	
if(FlagAllowFalling && Ground){
	if(((Angle >= 75 && Angle <= 285) && abs(Xsp) <= Fall) || !get_collision_sensor_bottom_big(player_collision_layer_list())){
		Ysp		=	Xsp	* -dsin(floor(Angle));
		Xsp		=	Xsp * dcos(floor(Angle));
		Angle	=	0;
		Ground	=	false;
	}
}

