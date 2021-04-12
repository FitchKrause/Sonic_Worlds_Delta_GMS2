///@description Initialization
///Variables
	PosX					=	Player_Start_Point.x + 16;
	PosY					=	Player_Start_Point.y + 16;
	Xsp						=	0;
	Gsp						=	0;
	Ysp						=	0;
	LandedSpeed				=	0;
	Angle					=	0;
	Layer					=	0;
	
///Constants
	Acc						=	0.046875;
	Dcc						=	0.5;
	Frc						=	Acc;
	AirAcc					=	0.09375;
	LandingCnvrF			=	0.5;
	SlopeF					=	0.152;
	TopSp					=	6;
	MaxSp					=	24;
	Fall					=	2.5;
	Grv						=	0.21875;
	
///Flags
	Ground					=	false;
	Landed					=	false;
	
///Allow Flags
	FlagAllowX				=	true;
	FlagAllowY				=	true;
	FlagAllowLanding		=	true;
	FlagAllowFalling		=	true;