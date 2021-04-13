/// @description End Step Update
///Camera Effects
if(CameraState == CameraModes.Normal){
	if(LagTimer == 0){
		///Scroll camera if Sonic passes the margin
		if(CameraX < CameraMaxX - GameWindowCenterWidth && Player.PosX > CameraX + 8 - ShiftX - ShiftXSpeed){CameraX	+=	min(16, Player.PosX - CameraX - 8 + ShiftXSpeed + ShiftX);}
		if(CameraX > CameraMinX + GameWindowCenterWidth && Player.PosX < CameraX - 8 - ShiftX - ShiftXSpeed){CameraX	+=	max(-16, Player.PosX - CameraX + 8 + ShiftXSpeed + ShiftX);}
	}
		
	///If on the ground and the camera is off-center vertically with Sonic, scroll toward Sonic's Y position.
	if(Player.Ground == true){
		if(CameraY > CameraMinY + GameWindowCenterHeight && Player.PosY < CameraY + ShiftY + ShiftYSpeed){CameraY		+=	max(-max(2, abs(Player.Xsp * dsin(Player.Angle))) - 1, Player.PosY - CameraY - ShiftY - ShiftYSpeed);}
		if(CameraY < CameraMaxY - GameWindowCenterHeight && Player.PosY > CameraY + ShiftY + ShiftYSpeed){CameraY		+=	min(max(2, abs(Player.Xsp * dsin(Player.Angle) * 2)) + 1, Player.PosY - CameraY - ShiftY - ShiftYSpeed);}
	}
		
	if(Player.Ground == false){
		if(CameraY > CameraMinY + GameWindowCenterHeight && Player.PosY < CameraY - 24 + ShiftY + ShiftYSpeed){CameraY	+=	max(-16, Player.PosY - CameraY + 24 - ShiftY - ShiftYSpeed);}
		if(CameraY < CameraMaxY - GameWindowCenterHeight && Player.PosY > CameraY + ShiftY + ShiftYSpeed + 24){CameraY	+=	max(0, min(16, Player.PosY - CameraY - ShiftY - 24) - ShiftYSpeed);}
	}
		
	if(Player.Landed == true){
		if(CameraY < CameraMaxY - GameWindowCenterHeight){CameraY	+=	max(0, min(16, Player.PosY - CameraY - ShiftY - 24) - ShiftYSpeed);}
	}
}

///If Camera is outside of a boundary, scroll back in.
if(CameraX <= CameraMinX + GameWindowCenterWidth){CameraX	=	min(CameraX + 16, CameraMinX + GameWindowCenterWidth);}
if(CameraX >= CameraMaxX - GameWindowCenterWidth){CameraX	=	max(CameraX - 16, CameraMaxX - GameWindowCenterWidth);}
if(CameraY <= CameraMinY + GameWindowCenterHeight){CameraY	=	min(CameraY + 16, CameraMinY + GameWindowCenterHeight);}
if(CameraY >= CameraMaxY - GameWindowCenterHeight){CameraY	=	max(CameraY - 16, CameraMaxY - GameWindowCenterHeight);}

///Move the literal camera position.
camera_set_view_pos(GameView, CameraX - GameWindowCenterWidth, CameraY - GameWindowCenterHeight);