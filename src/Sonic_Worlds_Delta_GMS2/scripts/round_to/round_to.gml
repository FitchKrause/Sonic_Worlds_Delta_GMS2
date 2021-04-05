///@function			round_to(variable, value);
///@param				variable
///@param				value
function				round_to(variable, value){
	///Initialization
	var result;
	
	///Update
	result	=	round(variable * value) / value;
	
	///Return
	return	result;
}