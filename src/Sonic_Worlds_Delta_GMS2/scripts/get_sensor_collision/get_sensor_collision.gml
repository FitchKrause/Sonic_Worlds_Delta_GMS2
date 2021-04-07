///@function				get_collision_sensor_main(object);
///@param					object
function					get_collision_sensor_main(object){
	///Initialziation
	var result, temp_mask;
	temp_mask			=	mask_index;
	
	///Update
	mask_index			=	spr_player_sensor_main;
	
	result				=	place_meeting(
							got_limited_position_x_with_offset(Player.PosX + sign(Player.Xsp), Player.Angle, 0, 0, CameraMinX, CameraMaxX),
							got_limited_position_y_with_offset(Player.PosY + sign(Player.Ysp), Player.Angle, 0, 0, CameraMinY, CameraMaxY),
							object);
							
	mask_index			=	temp_mask;
	
	///Return
	return	result;
}

///@function				get_collision_sensor_left(object);
///@param					object
function					get_collision_sensor_left(object){
	///Initialziation
	var result, temp_mask;
	temp_mask			=	mask_index;
	
	///Update
	mask_index			=	spr_player_sensor_mid;
	
	result				=	place_meeting(
							got_limited_position_x_with_offset(Player.PosX + sign(Player.Xsp), Player.Angle, -9, -2, CameraMinX, CameraMaxX),
							got_limited_position_y_with_offset(Player.PosY + sign(Player.Ysp), Player.Angle, -9, -2, CameraMinY, CameraMaxY),
							object);
	
	mask_index			=	temp_mask;
	
	///Return
	return	result;
}

///@function				get_collision_sensor_left_big(object);
///@param					object
function					get_collision_sensor_left_big(object){
	///Initialziation
	var result, temp_mask;
	temp_mask			=	mask_index;
	
	///Update
	mask_index			=	spr_player_sensor_big;
	
	result				=	place_meeting(
							got_limited_position_x_with_offset(Player.PosX + sign(Player.Xsp), Player.Angle, -9, -2, CameraMinX, CameraMaxX),
							got_limited_position_y_with_offset(Player.PosY + sign(Player.Ysp), Player.Angle, -9, -2, CameraMinY, CameraMaxY),
							object);
	
	mask_index			=	temp_mask;
	
	///Return
	return	result;
}

///@function				get_collision_sensor_right(object);
///@param					object
function					get_collision_sensor_right(object){
	///Initialziation
	var result, temp_mask;
	temp_mask			=	mask_index;
	
	///Update
	mask_index			=	spr_player_sensor_mid;
	
	result				=	place_meeting(
							got_limited_position_x_with_offset(Player.PosX + sign(Player.Xsp), Player.Angle,  9, -2, CameraMinX, CameraMaxX),
							got_limited_position_y_with_offset(Player.PosY + sign(Player.Ysp), Player.Angle,  9, -2, CameraMinY, CameraMaxY),
							object);
	
	mask_index			=	temp_mask;
	
	///Return
	return	result;
}

///@function				get_collision_sensor_right_big(object);
///@param					object
function					get_collision_sensor_right_big(object){
	///Initialziation
	var result, temp_mask;
	temp_mask			=	mask_index;
	
	///Update
	mask_index			=	spr_player_sensor_big;
	
	result				=	place_meeting(
							got_limited_position_x_with_offset(Player.PosX + sign(Player.Xsp), Player.Angle,  9, -2, CameraMinX, CameraMaxX),
							got_limited_position_y_with_offset(Player.PosY + sign(Player.Ysp), Player.Angle,  9, -2, CameraMinY, CameraMaxY),
							object);
	
	mask_index			=	temp_mask;
	
	///Return
	return	result;
}

///@function				get_collision_sensor_top(object);
///@param					object
function					get_collision_sensor_top(object){
	///Initialziation
	var result, temp_mask;
	temp_mask			=	mask_index;
	
	///Update
	mask_index			=	spr_player_sensor_mid;
	
	result				=	place_meeting(
							got_limited_position_x_with_offset(Player.PosX + sign(Player.Xsp), Player.Angle,  0, -12, CameraMinX, CameraMaxX),
							got_limited_position_y_with_offset(Player.PosY + sign(Player.Ysp), Player.Angle,  0, -12, CameraMinY, CameraMaxY),
							object);
	
	mask_index			=	temp_mask;
	
	///Return
	return	result;
}

///@function				get_collision_sensor_top_big(object);
///@param					object
function					get_collision_sensor_top_big(object){
	///Initialziation
	var result, temp_mask;
	temp_mask			=	mask_index;
	
	///Update
	mask_index			=	spr_player_sensor_big;
	
	result				=	place_meeting(
							got_limited_position_x_with_offset(Player.PosX + sign(Player.Xsp), Player.Angle,  0, -13, CameraMinX, CameraMaxX),
							got_limited_position_y_with_offset(Player.PosY + sign(Player.Ysp), Player.Angle,  0, -13, CameraMinY, CameraMaxY),
							object);
	
	mask_index			=	temp_mask;
	
	///Return
	return	result;
}

///@function				get_collision_sensor_bottom(object);
///@param					object
function					get_collision_sensor_bottom(object){
	///Initialziation
	var result, temp_mask;
	temp_mask			=	mask_index;
	
	///Update
	mask_index			=	spr_player_sensor_mid;
	
	result				=	place_meeting(
							got_limited_position_x_with_offset(Player.PosX + sign(Player.Xsp), Player.Angle,  0,  12, CameraMinX, CameraMaxX),
							got_limited_position_y_with_offset(Player.PosY + sign(Player.Ysp), Player.Angle,  0,  12, CameraMinY, CameraMaxY),
							object);
	
	mask_index			=	temp_mask;
	
	///Return
	return	result;
}

///@function				get_collision_sensor_bottom_big(object);
///@param					object
function					get_collision_sensor_bottom_big(object){
	///Initialziation
	var result, temp_mask;
	temp_mask			=	mask_index;
	
	///Update
	mask_index			=	spr_player_sensor_big;
	
	result				=	place_meeting(
							got_limited_position_x_with_offset(Player.PosX + sign(Player.Xsp), Player.Angle,  0,  13, CameraMinX, CameraMaxX),
							got_limited_position_y_with_offset(Player.PosY + sign(Player.Ysp), Player.Angle,  0,  13, CameraMinY, CameraMaxY),
							object);
	
	mask_index			=	temp_mask;
	
	///Return
	return	result;
}

///@function				get_collision_sensor_slopes(object);
///@param					object
function					get_collision_sensor_slopes(object){
	///Initialziation
	var result, temp_mask;
	temp_mask			=	mask_index;
	
	///Update
	mask_index			=	spr_player_sensor_big;
	
	result				=	place_meeting(
							got_limited_position_x_with_offset(Player.PosX + sign(Player.Xsp), Player.Angle,  0,  24, CameraMinX, CameraMaxX),
							got_limited_position_y_with_offset(Player.PosY + sign(Player.Ysp), Player.Angle,  0,  24, CameraMinY, CameraMaxY),
							object);
	
	mask_index			=	temp_mask;
	
	///Return
	return	result;
}

///@function				get_collision_sensor_edge_left(object);
///@param					object
function					get_collision_sensor_edge_left(object){
	///Initialziation
	var result, temp_mask, temp_mask_sprite, temp_mask_angle;
	temp_mask			=	mask_index;
	temp_mask_sprite	=	sprite_index;
	temp_mask_angle		=	image_angle;
	
	///Update
	mask_index			=	spr_player_sensor_line;
	sprite_index		=	spr_player_sensor_line;
	image_angle			=	Player.Angle;
	
	result				=	place_meeting(
							got_limited_position_x_with_offset(Player.PosX + sign(Player.Xsp), Player.Angle,  -8,  12, CameraMinX, CameraMaxX),
							got_limited_position_y_with_offset(Player.PosY + sign(Player.Ysp), Player.Angle,  -8,  12, CameraMinY, CameraMaxY),
							object);
	
	mask_index			=	temp_mask;
	sprite_index		=	temp_mask_sprite;
	image_angle			=	temp_mask_angle;
	
	///Return
	return	result;
}

///@function				get_collision_sensor_edge_right(object);
///@param					object
function					get_collision_sensor_edge_right(object){
	///Initialziation
	var result, temp_mask, temp_mask_sprite, temp_mask_angle;
	temp_mask			=	mask_index;
	temp_mask_sprite	=	sprite_index;
	temp_mask_angle		=	image_angle;
	
	///Update
	mask_index			=	spr_player_sensor_line;
	sprite_index		=	spr_player_sensor_line;
	image_angle			=	Player.Angle;
	
	result				=	place_meeting(
							got_limited_position_x_with_offset(Player.PosX + sign(Player.Xsp), Player.Angle,   8,  12, CameraMinX, CameraMaxX),
							got_limited_position_y_with_offset(Player.PosY + sign(Player.Ysp), Player.Angle,   8,  12, CameraMinY, CameraMaxY),
							object);
	
	mask_index			=	temp_mask;
	sprite_index		=	temp_mask_sprite;
	image_angle			=	temp_mask_angle;
	
	///Return
	return	result;
}