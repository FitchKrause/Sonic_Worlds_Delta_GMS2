///@description End Step Update
///Animation System
	if(Animation != AnimationToBeSet){
		Animation						=	AnimationToBeSet;
		AnimSubimageDurationTimer		=	AnimDurationSet;
		AnimSubimage					=	1;
		AnimSubimageNumber				=	sprite_get_number(Animation);
		AnimSubimageLoop				=	AnimSubimageLoopSet;
	}else{
		if(AnimSubimageDurationTimer > 0){
			AnimSubimageDurationTimer	--;
		}else{
			if(AnimSubimage > AnimSubimageNumber){
				if(AnimSubimageLoop == -1){
					AnimSubimage		=	1;
				}else{
					AnimSubimage		=	AnimSubimageLoop;
				}
			}
			AnimSubimage				++;
			
			AnimSubimageDurationTimer	=	AnimDurationSet;
		}
	}