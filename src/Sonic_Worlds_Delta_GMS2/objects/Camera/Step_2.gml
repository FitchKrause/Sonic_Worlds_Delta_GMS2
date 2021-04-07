/// @description End Step Update
///Position
	CameraX	=	Target.PosX;
	CameraY	=	Target.PosY;

///Camera View
	camera_set_view_pos(GameView, CameraX - GameWindowCenterWidth, CameraY - GameWindowCenterHeight);