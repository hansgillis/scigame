global time$__fps__;

function __ret__ = time$__repr__()
	__ret__ = "<module clock (handles the frames per second)>";
endfunction

function __ret__ = time$__str__(self)
	__ret__ = "frames per second: " + string(self.FPS);
endfunction

function time$__tick__();
	global time$__fps__;
	tic;sleep(time$__fps__);toc
endfunction

function self = Clock(frames_per_second)
    self = tlist (["__class__", "__repr__", "__str__", "tick"]);   
    self.__repr__ = time$__repr__;
    self.__str__ = time$__str__;
	self.tick = time$__tick__;
	global time$__fps__;
	time$__fps__ = 1000.0 / frames_per_second;
endfunction







