///@description Step Update
///Start Movement
	///Limit Decimals
	Xsp				=	decimal_floor_to(Xsp, 10000);
	Ysp				=	decimal_floor_to(Ysp, 10000);
	Angle			=	decimal_floor_to(Angle, 10000);
	
	///Limit Speed
	Xsp				=	clamp(Xsp, -MaxSp, MaxSp);
	Ysp				=	clamp(Ysp, -MaxSp, MaxSp);
	
	///Deactivate Landing Flag
	Landed			=	false;
	
	///Ground Speed
	if(Ground == true){
		Gsp			=	Xsp;
	}
	
///X and Y Movement
	///X Movement
	if(FlagAllowX == true){
		PosX		+=	Xsp * dcos(Angle);
		PosY		-=	Xsp * dsin(Angle);
	}
	
	///Y Movement
	if(FlagAllowY == true && Ground == false){
		PosY		+=	Ysp;
	}
	
///Collision
	///Horizontal Collision
	if(FlagAllowX == true){
		///Left
		while(Xsp <= 0 && get_collision_sensor_left(player_collision_layer_list())){
			PosX	+=	dcos(Angle);
			PosY	-=	dsin(Angle);
		}
		
		///Right
		while(Xsp >= 0 && get_collision_sensor_right(player_collision_layer_list())){
			PosX	-=	dcos(Angle);
			PosY	+=	dsin(Angle);
		}
	}
	
	///Vertical
	if(FlagAllowY == true && Ground == false){
		///Top
		while(Ysp <= 0 && get_collision_sensor_top(player_collision_layer_list())){
			PosY	++;
		}
		
		///Bottom
		while(Ysp >= 0 && get_collision_sensor_bottom(player_collision_layer_list())){
			PosY	--;
		}
	}
	
///Land
if(FlagAllowLanding == true){
	if(Ground == false){
		///Set LandingState
		if(get_collision_sensor_bottom_big(player_collision_layer_list()) && get_collision_sensor_floor_edge_center(player_collision_layer_list())) || (get_collision_sensor_top_big(player_collision_layer_list()) && get_collision_sensor_ceil_edge_center(player_collision_layer_list())){
			LandedSpeed		=	Ysp;
			Landed			=	true;
		}
	}
}

if(Landed == true){
	if(Ground == false){
		///Ground Landing
		if(Ysp > 0){
			Angle			=	0;
			
			///Check Center Edge
			if(get_collision_sensor_floor_edge_center(player_collision_layer_list())){
				Angle		=	player_get_angle();
			}
			
			///Calculate Landing Speed.
			if(((Angle >= 22.5 && Angle <= 45) || (Angle >= 316 && Angle <= 337.5))){
				Xsp			=	-dsin(Angle) * (LandedSpeed * LandingCnvrF);
			}

			if(((Angle >= 45 && Angle <= 90) || (Angle >= 270 && Angle <= 315))){
				Xsp			=	-dsin(Angle) * LandedSpeed;
			}
		
			///Set Ground
			if(get_collision_sensor_bottom_big(player_collision_layer_list())){
				Ysp			=	0;
				Ground		=	true;
			}
		}
		
		///Ceiling Landing
		if(Ysp <= -Fall){
			Angle			=	180;
			
			///Check Center Edge
			if(get_collision_sensor_floor_edge_center(player_collision_layer_list())){
				Angle		=	player_get_angle();
			}
			
			///Calculate Landing Speed.
			if(Angle >= 135 && Angle <= 225){
				Xsp			=	-dsin(Angle) * LandedSpeed;
			}
	
			///Land
			if(get_collision_sensor_bottom_big(player_collision_layer_list())){
				Ysp			=	0;
				Ground		=	true;
			}
		}
	}
}

///Slopes.
if(Ground == true){
	///Slopes Down.
	while(!get_collision_sensor_main(player_collision_layer_list()) && get_collision_sensor_slopes(player_collision_layer_list())){
		PosX		+=	dsin(Angle);
		PosY		+=	dcos(Angle);
	}
		
	///Slopes Up.
	while(get_collision_sensor_main(player_collision_layer_list())){
		PosX		-=	dsin(Angle);
		PosY		-=	dcos(Angle);
	}
}
	
///Surface Angle Detection
	if(Ground == true && get_collision_sensor_bottom_big(player_collision_layer_list()) && get_collision_sensor_floor_edge_center(player_collision_layer_list())){
		Angle		=	player_get_angle();
	}

///Falling
	///Slow down when going uphill and speed up when going downhill (slope factor).
	if(Ground == true){
		Xsp			-=	SlopeF * dsin(Angle);
	}
	
if(FlagAllowFalling == true && Ground == true){
	if(((Angle >= 75 && Angle <= 285) && abs(Xsp) <= Fall) || !get_collision_sensor_bottom_big(player_collision_layer_list())){
		Ysp			=	Xsp	* -dsin(floor(Angle));
		Xsp			=	Xsp * dcos(floor(Angle));
		Angle		=	0;
		Ground		=	false;
	}
}