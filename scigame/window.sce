function __ret__ = window$__repr__()
	__ret__ = "<module window (handles the main screen)>";
endfunction

function __ret__ = window$__str__(self)
	__ret__ = "window: position=[0, 0], size=[" + string(self.width) + ", " + string(self.height) + "]";
endfunction

function window$__destroy__(self)
	close();
endfunction

function self = Window(size)
    self = tlist (["__class__", "__destroy__", "__repr__", "__str__", "width", "height", "screen"]);
	self.__destroy__ = window$__destroy__;
    self.__repr__ = window$__repr__;
    self.__str__ = window$__str__;
    self.width = size(1);
    self.height = size(2);
	self.screen = scf(0);
	set(self.screen, "position", [0, 0, self.width, self.height]);
	handle = gca();
	handle.margins = [0, 0, 0, 0];
endfunction
