function __ret__ = sprite$__repr__()
	__ret__ = "<module sprite (extends image class)>";
endfunction

function __ret__ = sprite$__str__(self)
	pos = get(self.image.control, "position");
	__ret__ = "sprite: position=[" + string(pos(1)) + ", " + string(pos(2)) + "], size=[" + string(pos(3)) + ", " + string(pos(4)) + "]";
endfunction

function self = Sprite(window, image)
    self = tlist (["__class__", "__repr__", "__str__", "window", "image"]);
    self.__repr__ = sprite$__repr__;
    self.__str__ = sprite$__str__;
	self.window = window;
	self.image = image;
endfunction

function render(sprite, position)
	x = position(1);
	y = sprite.window.height - position(2);
	w = sprite.image.width;
	h = sprite.image.height;
	set(sprite.image.control, "position", [x, y, w, h]);
endfunction

function move(sprite, dx, dy)
	pos = get(sprite.image.control, "position");
	set(sprite.image.control, "position", [pos(1) + dx, pos(2) - dy, pos(3), pos(4)]);
endfunction

function __ret__ = get_position(sprite)
	position = get(sprite.image.control, "position");
	__ret__ = zeros(2);
	__ret__(1) = position(1);
	__ret__(2) = position(2);
endfunction

function __ret__ = get_size(sprite)
	position = get(sprite.image.control, "position");
	__ret__ = zeros(2);
	__ret__(1) = position(3);
	__ret__(2) = position(4);
endfunction

function __ret__ = get_rectangle(sprite)
	position = get(sprite.image.control, "position");
	__ret__ = position;
endfunction

function set_x(sprite, x)
	pos = get(sprite.image.control, "position");
	set(sprite.image.control, "position", [x, pos(2), pos(3), pos(4)]);
endfunction

function set_y(sprite, y)
	pos = get(sprite.image.control, "position");
	set(sprite.image.control, "position", [pos(1), y, pos(3), pos(4)]);
endfunction

function __ret__ = collision(sprite1, sprite2)
	this = sprite1.image;
	that = sprite2.image;
	__ret__ = %F
	p1 = get(this.control, "position");
	x1 = p1(1);
	y1 = p1(2);
	w1 = this.width;
	h1 = this.height;
	
	p2 = get(that.control, "position");
	x2 = p2(1);
	y2 = p2(2);
	w2 = that.width;
	h2 = that.height;
	
	if (x1 < x2 + w2 & ...
	    x2 < x1 + w1 & ...
	    y1 < y2 + h2 & ...
	    y2 < y1 + h1) | ...
	   (x1 < x2 & ...
	    x2 < x1 + w1 & ...
	    y1 < y2 & ...
	    y2 < y1 + h1) then
		__ret__ = %T;
	end
endfunction


