global event$__mouse_x__;
global event$__mouse_y__;
global event$__key__;
event$__mouse_x__ = 0;
event$__mouse_y__ = 0;
event$__key__ = 0;

function __ret__ = event$__repr__()
	__ret__ = "<module event (handles keyboard and mouse input)>";
endfunction

function __ret__ = event$__str__(self)
	__ret__ = "current event: print(self)";
endfunction

function x = get_mouse_x()
	global event$__mouse_x__;
	x = event$__mouse_x__;
endfunction

function y = get_mouse_y()
	global event$__mouse_y__;
	y = event$__mouse_y__;
endfunction

function key = get_key()
	global event$__key__;
	key = event$__key__;
endfunction

function __ret__ = event$__poll__(id)
	__ret__ = %F;
	key = get_key();
	if key == id then
		__ret__ = %T;
	end
endfunction

function event$__get_events__(win, x, y, ibut)
	global event$__mouse_x__;
	global event$__mouse_y__;
	global event$__key__;
	event$__mouse_x__ = x;
	event$__mouse_y__ = y;
	event$__key__ = ibut;
endfunction

function self = Event()
    self = tlist (["__class__", "__repr__", "__str__", "poll", "keys"]);   
    self.__repr__ = event$__repr__;
    self.__str__ = event$__str__;
    self.poll = event$__poll__;
	fig = gcf() ;
	fig.event_handler = "event$__get_events__";
	fig.event_handler_enable = "on";
endfunction







