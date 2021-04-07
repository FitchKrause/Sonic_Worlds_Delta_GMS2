///@function				player_get_angle();
function player_get_angle(){
	///Initialization
	var	result, temp_mask, place_angle, x_point_a, y_point_a, x_point_b, y_point_b;
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
	
	result		=	floor(point_direction(x_point_a, y_point_a, x_point_b, y_point_b));
	
	///Return
	return	result;
}