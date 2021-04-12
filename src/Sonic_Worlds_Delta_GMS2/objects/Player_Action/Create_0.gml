///@description Initialization
///States
enum Action{
	Normal,
	Jump,
	Roll,
	Spindash,
	LookUp,
	Crouch,
}

///Variables
	SpinRev		=	0
	State		=	Action.Normal;
	
///Constants
	///Jump
	MinJmpPower	=	-4;
	MaxJmpPower	=	-6.5;
	
	///Spindash
	SpinCharge	=	1;
	SpinLose	=	0.01;
	MinSpinRev	=	8;
	MaxSpinRev	=	12;