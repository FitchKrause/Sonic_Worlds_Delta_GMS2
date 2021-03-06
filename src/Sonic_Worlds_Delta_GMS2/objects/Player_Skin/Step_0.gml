///@description Step Update
///Variables
GroundSpeed	=	abs(Player.Gsp);

///Angle Mode
if(Player.Ground){
	if(Player.Angle >= 0 && Player.Angle <= 45){		AngleMode	=	0}
	if(Player.Angle >= 46 && Player.Angle <= 134){		AngleMode	=	1}
	if(Player.Angle >= 135 && Player.Angle <= 225){		AngleMode	=	2}
	if(Player.Angle >= 226 && Player.Angle <= 314){		AngleMode	=	3}
	if(Player.Angle >= 315 && Player.Angle <= 360){		AngleMode	=	0}
}else{
	AngleMode	=	0;
}

///Offset
if(AngleMode == 2 || AngleMode == 3){AnimOffsetX	=	1}else{AnimOffsetX	=	0}
if(AngleMode == 1 || AngleMode == 2){AnimOffsetY	=	1}else{AnimOffsetY	=	0}
	
///Animation
	///Idle
	if(Player.Ground && GroundSpeed == 0){
		AnimationToBeSet		=	spr_skin_sonic_idle;
		AnimDurationSet			=	24;
		AnimSubimageLoopSet		=	-1;
	}

	///Walk
	if(GroundSpeed > 0 && GroundSpeed <= 6){
		AnimationToBeSet		=	spr_skin_sonic_walk;
		AnimDurationSet			=	floor(max(0, 8 - GroundSpeed));
		AnimSubimageLoopSet		=	-1;
	}
	
	///Run
	if(GroundSpeed > 6 && GroundSpeed <= 12){
		AnimationToBeSet		=	spr_skin_sonic_run;
		AnimDurationSet			=	floor(max(0, 8 - GroundSpeed));
		AnimSubimageLoopSet		=	-1;
	}
	
	///Peelout Run
	if(GroundSpeed > 12){
		AnimationToBeSet		=	spr_skin_sonic_peelout_run;
		AnimDurationSet			=	floor(max(0, 0));
		AnimSubimageLoopSet		=	-1;
	}
	
	///Look Up
	if(Player_Action.State == Action.LookUp){
		AnimSubimageLoopSet		=	2;
		AnimationToBeSet		=	spr_skin_sonic_lookup;
		AnimDurationSet			=	floor(max(0, 4));
	}
	
	///Crouch Down
	if(Player_Action.State == Action.Crouch){
		AnimSubimageLoopSet		=	2;
		AnimationToBeSet		=	spr_skin_sonic_crouch;
		AnimDurationSet			=	floor(max(0, 4));
	}
	
	///Jump
	if(Player_Action.State == Action.Jump){
		AnimationToBeSet		=	spr_skin_sonic_spin;
		AnimDurationSet			=	floor(max(0, 4 - GroundSpeed));
		AnimSubimageLoopSet		=	-1;
	}
	
	///Spindash
	if(Player_Action.State == Action.Spindash){
		AnimationToBeSet		=	spr_skin_sonic_spindash;
		AnimDurationSet			=	floor(max(0, 12 - Player_Action.SpinRev));
		AnimSubimageLoopSet		=	-1;
	}

if(Input.KeyLeft){
	Direction	=	-1;
}
if(Input.KeyRight){
	Direction	=	1;
}

VisualAngle	=	floor(Player.Angle);