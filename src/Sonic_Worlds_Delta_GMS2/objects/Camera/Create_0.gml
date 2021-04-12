///@description Initialization
///Variables
	CameraX				=	Player.PosX;
	CameraY				=	Player.PosY;
	ShiftX				=	0;
	ShiftY				=	0;
	ShiftXSpeed			=	0;
	ShiftYSpeed			=	0;
	LagTimer			=	0;
	ShakeTimer			=	0;
	CameraState			=	0;
	CameraAction		=	0;
	LookUpTimer			=	0;
	LookDownTimer		=	0;
	HardShakeTimer		=	0;
	
///States
enum	CameraModes{
	Normal,
	Boss,
	StageClear,
	Death,
	SecondAct
}

CameraState	=	CameraModes.Normal;

///Flags
	BossDefeated		=	false;