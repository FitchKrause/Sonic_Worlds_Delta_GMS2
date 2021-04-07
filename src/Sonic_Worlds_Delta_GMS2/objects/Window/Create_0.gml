///@description Initialization
///Window
	WindowScale			=	3;
	WindowScaleWidth	=	GameResolutionWidth * WindowScale;
	WindowScaleHeight	=	GameResolutionHeight * WindowScale;
	
	///Size
	window_set_size(WindowScaleWidth, WindowScaleHeight);

///Set Resolution
	surface_resize(application_surface, GameResolutionWidth, GameResolutionHeight);
	alarm[0]	=	true;