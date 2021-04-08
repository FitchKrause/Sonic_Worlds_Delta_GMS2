///@function				player_get_angle();
function player_get_angle(){
	///Initialization
	var	result, temp_mask, place_angle, x_point_a, y_point_a, x_point_b, y_point_b, calculation_x, calculation_y;
	place_angle			=	round_to(Player.Angle, 10)
	temp_mask			=	mask_index;
	x_point_a			=	got_limited_position_x_with_offset(Player.PosX, place_angle, -7, 0, CameraMinX, CameraMaxX);
	y_point_a			=	got_limited_position_y_with_offset(Player.PosY, place_angle, -7, 0, CameraMinY, CameraMaxY);
	x_point_b			=	got_limited_position_x_with_offset(Player.PosX, place_angle,  7, 0, CameraMinX, CameraMaxX);
	y_point_b			=	got_limited_position_y_with_offset(Player.PosY, place_angle,  7, 0, CameraMinY, CameraMaxY);
	
	///Update
	mask_index			=	spr_player_sensor_dot;
	
	repeat(24){
		while(!place_meeting(x_point_a, y_point_a, player_collision_layer_list())){
			x_point_a	+=	dsin(place_angle);
			y_point_a	+=	dcos(place_angle);
		}
		while(!place_meeting(x_point_b, y_point_b, player_collision_layer_list())){
			x_point_b	+=	dsin(place_angle);
			y_point_b	+=	dcos(place_angle);
		}
	}
	
	mask_index	=	temp_mask;
	
	calculation_x		=	x_point_a - x_point_b;
	calculation_y		=	y_point_a - y_point_b;
	
	///Perform angle equation
	result				=	-darctan((calculation_y * 1)/ (calculation_x * 1));
	
	///Normally after reaching 90 degrees the value begins to increase, so instead I added 180 from the value to allow it to continue subtracting. This also prevents the angle value from going negative.
	if(result < 0){
		result			+=	180;
	}
	
	///From this point, the angle value only goes up to 180 degrees. To continue on to 360, a check is needed. If Point B's Y position is greater than Point A's Y position, add 180.
	if(calculation_y < 0){
		result			+=	180;
	}
	
	///This fixes a problem with the above method. The supposed-to-be 180 degree became 0 degrees, so we need to set the angle value to 180 if it equals 0 and Point B's X is lower than Point A's X. ( If wanted, you could check if the Y's are equal instead of checking if the value is 0. )
	if(result == 0 && calculation_x > 0){
		result			=	180;
	}
	
	///There are some cases, that when the X position of both two objects are the same, the angle is set to 0. We can fix this by checking the X positions and their Y, wich depending on wich is greater, the values are set to 90 or 270 :)
	if(result == 0 && calculation_y > 0){
		result			=	90;
	}
	if(result == 180 && calculation_y < 0){
		result			=	270;
	}
	
	///Return
	return	result;
}