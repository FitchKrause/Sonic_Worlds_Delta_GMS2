///@function				player_collision_layer_list();
function player_collision_layer_list(){
	///Initialization
	var result;
	
	///Update
	if(Player.Layer != 0){
		result	=	Player.Layer;
	}else{
		result	=	Grp_Layer_Main;
	}
	
	///Return
	return	result;
}