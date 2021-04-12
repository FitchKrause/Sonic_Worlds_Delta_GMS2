///@description Step Update

if(State == Action.Normal){
	///Look Up
	if(Player.Ground && abs(Player.Xsp) == 0 && Input.KeyUp && !Input.KeyLeft && !Input.KeyRight){State = Action.LookUp;}
	
	///Crouch Down
	if(Player.Ground && abs(Player.Xsp) == 0 && Input.KeyDown && !Input.KeyLeft && !Input.KeyRight){State = Action.Crouch;}

	///Jump
	if(Player.Ground && Input.KeyPressAction){
		State					=	Action.Jump;
		Player.Ysp				=	dcos(Player.Angle) * MaxJmpPower - dsin(Player.Angle) * Player.Xsp;
		Player.Xsp				=	dsin(Player.Angle) * MaxJmpPower + dcos(Player.Angle) * Player.Xsp;
		Player.Angle			=	0;
		Player.Ground			=	false;
	}
}

///Look Up
if(State == Action.LookUp){
	///Return to normal if this criteria is matched
	if(!Player.Ground){State = Action.Normal;}
	if(abs(Player.Xsp) > 0){State = Action.Normal;}
	if(!Input.KeyUp){State = Action.Normal;}
}

///Crouch Down
if(State == Action.Crouch){
	///Return to normal if this criteria is matched
	if(!Player.Ground){State = Action.Normal;}
	if(abs(Player.Xsp) > 0){State = Action.Normal;}
	if(!Input.KeyDown){State = Action.Normal;}
	
	///Spindash
	if(Input.KeyPressAction){
		SpinRev	=	MinSpinRev;
		State	= Action.Spindash;
	}
}

///Jump
if(State == Action.Jump){
	if(!Input.KeyAction){
		if(Player.Ysp < MinJmpPower){Player.Ysp = MinJmpPower;}
	}
	
	if(Player.Ground){State = Action.Normal;}
}

///Spindash
if(State == Action.Spindash){
	///Roll if the player isn't holding down anymore
	if(!Input.KeyDown){
		State		=	Action.Normal;
		Player.Xsp	=	SpinRev * Player_Skin.Direction;
	}
	
	///If the action key is pressed, add a rev
	if(Input.KeyPressAction){
		SpinRev		=	min(SpinRev + SpinCharge, MaxSpinRev);
	}
	
	///If not, slowly decrease the revs
	if(!Input.KeyPressAction){
		SpinRev		= max(SpinRev - SpinLose, MinSpinRev);
	}
}