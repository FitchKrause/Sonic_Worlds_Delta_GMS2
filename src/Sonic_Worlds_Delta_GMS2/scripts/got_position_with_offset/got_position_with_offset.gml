///Not Limited
	///Without Distance
		///@function				got_position_x_with_offset(pos_x, pos_angle, pos_offset_x, pos_offset_y);
		///@param					pos_x
		///@param					pos_angle
		///@param					pos_offset_x
		///@param					pos_offset_y
		function got_position_x_with_offset(pos_x, pos_angle, pos_offset_x, pos_offset_y){
			///Initialziation
			var result;
		
			///Update
			result	=	(pos_x + (dcos(pos_angle) * pos_offset_x) + (dsin(pos_angle) * pos_offset_y));
		
			///Return
			return	result;
		}
		
		///@function				got_position_y_with_offset(pos_y, pos_angle, pos_offset_x, pos_offset_y);
		///@param					pos_y
		///@param					pos_angle
		///@param					pos_offset_x
		///@param					pos_offset_y
		function got_position_y_with_offset(pos_y, pos_angle, pos_offset_x, pos_offset_y){
			///Initialziation
			var result;
		
			///Update
			result	=	(pos_y + (dcos(pos_angle) * pos_offset_y) - (dsin(pos_angle) * pos_offset_x));
		
			///Return
			return	result;
		}

	///With Distance
		///@function				got_position_x_with_offset_and_distance(pos_x, pos_angle, pos_offset_x, pos_offset_y, offset_distance);
		///@param					pos_x
		///@param					pos_angle
		///@param					pos_offset_x
		///@param					pos_offset_y
		///@param					offset_distance
		function got_position_x_with_offset_and_distance(pos_x, pos_angle, pos_offset_x, pos_offset_y, offset_distance){
			///Initialziation
			var result;
		
			///Update
			result	=	(pos_x + (dcos(pos_angle) * pos_offset_x) + (dsin(pos_angle) * (pos_offset_y + offset_distance)));
		
			///Return
			return	result;
		}
		
		///@function				got_position_y_with_offset_and_distance(pos_y, pos_angle, pos_offset_x, pos_offset_y, offset_distance);
		///@param					pos_y
		///@param					pos_angle
		///@param					pos_offset_x
		///@param					pos_offset_y
		///@param					offset_distance
		function got_position_y_with_offset_and_distance(pos_y, pos_angle, pos_offset_x, pos_offset_y, offset_distance){
			///Initialziation
			var result;
		
			///Update
			result	=	(pos_y + (dcos(pos_angle) * (pos_offset_y + offset_distance)) - (dsin(pos_angle) * pos_offset_x));
		
			///Return
			return	result;
		}

///Limited
	///Without Distance
		///@function				got_limited_position_x_with_offset(pos_x, pos_angle, pos_offset_x, pos_offset_y, min_pos_x, max_pos_x);
		///@param					pos_x
		///@param					pos_angle
		///@param					pos_offset_x
		///@param					pos_offset_y
		///@param					min_pos_x
		///@param					max_pos_x
		function got_limited_position_x_with_offset(pos_x, pos_angle, pos_offset_x, pos_offset_y, min_pos_x, max_pos_x){
			///Initialziation
			var result;
		
			///Update
			result	=	min(max((pos_x + (dcos(pos_angle) * pos_offset_x) + (dsin(pos_angle) * pos_offset_y)), min_pos_x), max_pos_x);
		
			///Return
			return	result;
		}
		
		///@function				got_limited_position_y_with_offset(pos_y, pos_angle, pos_offset_x, pos_offset_y, min_pos_y, max_pos_y);
		///@param					pos_y
		///@param					pos_angle
		///@param					pos_offset_x
		///@param					pos_offset_y
		///@param					min_pos_y
		///@param					max_pos_y
		function got_limited_position_y_with_offset(pos_y, pos_angle, pos_offset_x, pos_offset_y, min_pos_y, max_pos_y){
			///Initialziation
			var result;
		
			///Update
			result	=	min(max((pos_y + (dcos(pos_angle) * pos_offset_y) - (dsin(pos_angle) * pos_offset_x)), min_pos_y), max_pos_y);
		
			///Return
			return	result;
		}

	///With Distance
		///@function				got_limited_position_x_with_offset_and_distance(pos_x, pos_angle, pos_offset_x, pos_offset_y, offset_distance, min_pos_x, max_pos_x);
		///@param					pos_x
		///@param					pos_angle
		///@param					pos_offset_x
		///@param					pos_offset_y
		///@param					offset_distance
		///@param					min_pos_x
		///@param					max_pos_x
		function got_limited_position_x_with_offset_and_distance(pos_x, pos_angle, pos_offset_x, pos_offset_y, offset_distance, min_pos_x, max_pos_x){
			///Initialziation
			var result;
		
			///Update
			result	=	min(max((pos_x + (dcos(pos_angle) * pos_offset_x) + (dsin(pos_angle) * (pos_offset_y + offset_distance))), min_pos_x), max_pos_x);
		
			///Return
			return	result;
		}
		
		///@function				got_limited_position_y_with_offset_and_distance(pos_y, pos_angle, pos_offset_x, pos_offset_y, offset_distance, min_pos_y, max_pos_y);
		///@param					pos_y
		///@param					pos_angle
		///@param					pos_offset_x
		///@param					pos_offset_y
		///@param					offset_distance
		///@param					min_pos_y
		///@param					max_pos_y
		function got_limited_position_y_with_offset_and_distance(pos_y, pos_angle, pos_offset_x, pos_offset_y, offset_distance, min_pos_y, max_pos_y){
			///Initialziation
			var result;
		
			///Update
			result	=	min(max((pos_y + (dcos(pos_angle) * (pos_offset_y + offset_distance)) - (dsin(pos_angle) * pos_offset_x)), min_pos_y), max_pos_y);
		
			///Return
			return	result;
		}