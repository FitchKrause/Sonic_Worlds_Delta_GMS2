///@function			decimal_floor_to(variable, value);
///@param				variable
///@param				value
function				decimal_floor_to(variable, value){
	///Initialization
	var result;
	
	///Update
	result	=	floor(variable * value) / value;

	///Return
	return result;
}