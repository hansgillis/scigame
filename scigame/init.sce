clear();
clearglobal();
funcprot(0);

function print(object)
	a = object.__str__;
    disp(a(object));
endfunction

function repr(object)
	a = object.__repr__;
    disp(a());
endfunction

function destroy(object)
	a = object.__destroy__;
    a();
endfunction

exec("scigame/window.sce");
exec("scigame/events.sce");
exec("scigame/sprite.sce");
exec("scigame/image.sce");
exec("scigame/time.sce");
event = Event();
clock = Clock(64);
tick = clock.tick;