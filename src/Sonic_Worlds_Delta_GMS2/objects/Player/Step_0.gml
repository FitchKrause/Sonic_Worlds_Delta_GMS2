///@description Step Update
///Start Player Movement
	///Limit Decimals
	Xsp		=	floor_to(Xsp, 10000);
	Ysp		=	floor_to(Ysp, 10000);
	Angle	=	floor_to(Angle, 10000);
	
	///Limit Speed
	Xsp		=	clamp(Xsp, -MaxSp, MaxSp);
	Ysp		=	clamp(Ysp, -MaxSp, MaxSp);
	
	///Deactivate Landing Flag
	Landed	=	false;
	
///X Movement and Wall Collision
if(FlagAllowX){
	///Movement X
	PosX	+=	Xsp * dcos(Angle);
	PosY	-=	Xsp * dsin(Angle);
	
	///Wall Collision
	while(Xsp < 0 && get_collision_sensor_left(player_collision_layer_list())){
		PosX	+=	dcos(Angle);
		PosY	-=	dsin(Angle);
	}
	while(Xsp > 0 && get_collision_sensor_right(player_collision_layer_list())){
		PosX	-=	dcos(Angle);
		PosY	+=	dsin(Angle);
	}
}

///Y Movement
if(FlagAllowY){
	///Movement Y
	if(!Ground){
		PosY	+=	Ysp;
	}
	
	///Collisions with Ceil
	while(Ysp < 0 && get_collision_sensor_top(player_collision_layer_list())){
		PosY	++;
	}
	
	///Collision with Floor
	while(Ysp > 0 && get_collision_sensor_bottom(player_collision_layer_list())){
		PosY	--;
	}
}

///Landing
if(FlagAllowLanding){
	///Land
	if(!Ground && Ysp >= 0 && get_collision_sensor_bottom_big(player_collision_layer_list())){
		Angle	=	0;
	}
	
	///Check both edges. If they collide, we can check angle.
	if(!Ground && Ysp >= 0 && get_collision_sensor_bottom_big(player_collision_layer_list()) && 
	(get_collision_sensor_edge_left(player_collision_layer_list()) || 
	get_collision_sensor_edge_right(player_collision_layer_list()))){
		Angle	=	player_get_angle();
	}
	
	///Change speed in consecuence
	if(!Ground && Ysp >= 0 && get_collision_sensor_bottom_big(player_collision_layer_list())){
		if((Angle >= 22.5 && Angle < 45) || (Angle > 315 && Angle <= 337.5)){
			Xsp	-=	dsin(Angle) * (Ysp * 0.5);
		}
		if((Angle >= 45 && Angle < 90) || (Angle > 270 && Angle <= 315)){
			Xsp	-=	dsin(Angle) * Ysp;
		}
	}
	
	///Landing
	if(!Ground && Ysp >= 0 && get_collision_sensor_bottom_big(player_collision_layer_list())){
		LandedSpeed	=	Ysp;
		Ysp			=	0;
		Ground		=	true;
		Landed		=	true;
	}
}

///Slopes
if(Ground){
	///Slope Down
	while(!get_collision_sensor_main(player_collision_layer_list())){
		while(get_collision_sensor_slopes(player_collision_layer_list())){
			PosX	+=	dsin(Angle);
			PosY	+=	dcos(Angle);
		}
	}
	
	///Slopes Up
	while(get_collision_sensor_main(player_collision_layer_list())){
		PosX	-=	dsin(Angle);
		PosY	-=	dcos(Angle);
	}
}

///Surface Angle Detection
if(Ground && get_collision_sensor_edge_left(player_collision_layer_list()) && 
get_collision_sensor_edge_right(player_collision_layer_list())){
	Angle	=	player_get_angle();
}

///Falling Cases
if(FlagAllowFalling){
	///Fall when not enought speed
	if(Ground && (Angle >= 75 && Angle <= 285) && abs(Xsp) < (0.4 + abs(min(dcos(Angle), 0)) * 2)){
		Ysp		=	Xsp * -dsin(floor(Angle));
		Xsp		=	Xsp *  dcos(floor(Angle));
		Angle	=	0;
		Ground	=	false;
	}
	
	///Fall when not ground anymore
	if(Ground && !get_collision_sensor_bottom_big(player_collision_layer_list())){
		Ysp		=	Xsp * -dsin(floor(Angle));
		Xsp		=	Xsp *  dcos(floor(Angle));
		Angle	=	0;
		Ground	=	false;
	}
}