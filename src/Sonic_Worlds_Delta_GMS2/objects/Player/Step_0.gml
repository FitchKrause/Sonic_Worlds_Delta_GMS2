///@description Step Update
///Start Movement
	///Limit Speed
	Xsp	=	clamp(Xsp, -MaxSp, MaxSp);
	Ysp	=	clamp(Ysp, -MaxSp, MaxSp);
	
	///Deactivate Landing Flag
	Landed	=	false;
	
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
	///Set Ground State
	if(Ysp >= 0 && !Ground && get_collision_sensor_bottom_big(player_collision_layer_list())){
		Landed		=	true;
		LandedSpeed	=	Ysp;
		Ground		=	true;
	}
}

///Landing
if(Landed){
	///Ground Landing
		///Check both edges. If they collide, we can check angle.
		if(get_collision_sensor_edge_left(player_collision_layer_list()) || get_collision_sensor_edge_right(player_collision_layer_list())){
			Angle		=	player_get_angle();
		}

		///If the player is on ground, set Y Speed to 0.
		if(Ground){
			Ysp			=	0;
		}

	///Ceiling Landing.
	///Calculate Landing Speed.
		if(((Angle >= 22.5 && Angle < 45) || (Angle > 315 && Angle <= 337.5))){
			Xsp	=	-dsin(Angle) * (LandedSpeed * LandingCnvrF);
		}

		if(((Angle >= 45 && Angle < 90) || (Angle > 270 && Angle <= 315))){
			Xsp	=	-dsin(Angle) * LandedSpeed;
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
if(Ground && get_collision_sensor_bottom_big(player_collision_layer_list())){
	if(get_collision_sensor_edge_left(player_collision_layer_list()) && get_collision_sensor_edge_right(player_collision_layer_list())){
		Angle		=	player_get_angle();
	}
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

