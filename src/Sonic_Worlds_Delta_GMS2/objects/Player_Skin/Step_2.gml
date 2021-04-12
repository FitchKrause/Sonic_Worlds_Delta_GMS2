///@description End Step Update
///Animation System
	///Change Animation
	if(Animation != AnimationToBeSet){
		Animation						=	AnimationToBeSet;
		AnimSubimageDurationTimer		=	AnimDurationSet;
		AnimSubimageNumber				=	sprite_get_number(Animation);
		AnimSubimageLoop				=	AnimSubimageLoopSet;
		AnimSubimage					=	1;
	}else{
		///Subimage Handlign
		if(AnimSubimageDurationTimer > 0){
			AnimSubimageDurationTimer	--;
		}else{
			if(AnimSubimage > AnimSubimageNumber){
				AnimSubimage	=	1;
			}
			
			///Move To Next Subimage
			AnimSubimage				++;
			AnimSubimageDurationTimer	=	AnimDurationSet;
		}
	}