function __ret__ = image$__repr__()
	__ret__ = "<module image (handles image properties)>";
endfunction

function __ret__ = image$__str__(self)
	__ret__ = "image: position=[" + string(self.x) + ", " + string(self.y) + "], size=[" + string(self.width) + ", " + string(self.height) + "]";
endfunction

function self = Image(pathfile, position)
    self = tlist (["__class__", "__repr__", "__str__", "x", "y", "width", "height", "control"]);   
    self.__repr__ = image$__repr__;
    self.__str__ = image$__str__;
	self.x = position(1);
	self.y = position(2);
    self.width = position(3);
    self.height = position(4);
	f = figure(0);
	self.control = uicontrol(f, "style", "image", ...
								"string", pathfile, ...
								"position", position); 
endfunction

function blit(window, img, position)
	x = position(1);
	y = window.height - position(2);
	w = img.width;
	h = img.height;
	set(img.control, "position", [x, y, w, h]);
endfunction
