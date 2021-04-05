///@function				player_get_angle();
function player_get_angle(){
	///Initialization
	var	result,	temp_mask, x_point_a, y_point_a, x_point_b, y_point_b, calculation_angle_x, calculation_angle_y;
	temp_mask			=	mask_index;
	x_point_a			=	got_position_x_with_offset(Player.PosX, Player.Angle, -7, 0);
	y_point_a			=	got_position_y_with_offset(Player.PosY, Player.Angle, -7, 0);
	x_point_b			=	got_position_x_with_offset(Player.PosX, Player.Angle,  7, 0);
	y_point_b			=	got_position_y_with_offset(Player.PosY, Player.Angle,  7, 0);
	
	///Update
	mask_index			=	spr_player_sensor_dot;
	
	repeat(24){
		while(!place_meeting(x_point_a, y_point_a, player_collision_layer_list())){
			x_point_a	+=	dsin(Player.Angle);
			y_point_a	+=	dcos(Player.Angle);
		}
		while(!place_meeting(x_point_b, y_point_b, player_collision_layer_list())){
			x_point_b	+=	dsin(Player.Angle);
			y_point_b	+=	dcos(Player.Angle);
		}
	}
	
	mask_index	=	temp_mask;
	
	calculation_angle_x	=	x_point_a - x_point_b;
	calculation_angle_y	=	y_point_a - y_point_b;
	
	result	=	-darctan((calculation_angle_y * 1) / (calculation_angle_x * 1));
	
	if(result < 0){
		result	+=	180;
	}
	
	if(calculation_angle_y < 0){
		result	+=	180;
	}
	
	if(result == 0 && calculation_angle_x > 0){
		result	=	180;
	}
	
	if(result == 0 && calculation_angle_y > 0){
		result	=	90;
	}
	
	if(result == 180 && calculation_angle_y < 0){
		result	=	270;
	}
	
	///Return
	return	result;
}