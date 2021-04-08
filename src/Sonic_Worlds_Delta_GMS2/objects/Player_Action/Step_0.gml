///@description Step Update
///Actions
	///Common
		///Crouch
		if(Action == 0 && Player.Ground && Player.Xsp == 0 && Input.KeyDown && !Input.KeyLeft && !Input.KeyRight){
			Action			=	3;
		}
		
		///Jump
		if(Action == 0 && Player.Ground && Input.KeyPressAction){
			Action			=	1;
			Player.Ysp		=	dcos(Player.Angle) * MaxJmpPower - dsin(Player.Angle) * Player.Xsp;
			Player.Xsp		=	dsin(Player.Angle) * MaxJmpPower + dcos(Player.Angle) * Player.Xsp;
			Player.Angle	=	0;
			Player.Ground	=	false;
		}
		
	///Crouch
	if(Action == 3){
		if(!Player.Ground){
			Action		=	0;
		}
	
		if(Player.Xsp <> 0){
			Action		=	0;
		}
	
		if(!Input.KeyDown){
			Action		=	0;
		}
		
		///Spindash
		if(Input.KeyPressAction){
			SpinRev		=	MinSpinRev;
			Action		=	5;
		}
	}
	
	///Jump
	if(Action == 1){
		if(!Input.KeyAction){
			if(Player.Ysp < MinJmpPower){
				Player.Ysp	=	MinJmpPower;
			}
		}
		
		if(Player.Landed){
			Action			=	0;
		}
	}
	
	///Spindash
	if(Action == 5){
		if(!Input.KeyDown){
			Player.Xsp		=	Player_Skin.Direction * SpinRev;
			Action	=	0;
		}
		
		if(Input.KeyPressAction){
			SpinRev		=	min(SpinRev + SpinCharge, MaxSpinRev);
		}
		
		if(!Input.KeyPressAction){
			SpinRev		=	max(SpinRev - SpinLose, MinSpinRev);
		}
	}
	
	///Rolling
	