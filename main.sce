// initialiseert en importeert scigame module
exec("scigame/__init__.sce");
exec("logic.sce");

function main()
	// maakt een venster
	window = Window([800, 600]);
	
	// laad een afbeelding in een variabele
	// image = load_image(pathfile, [x, y, breedte, hoogte])
	bg = load_image("img/background.png", [0, 0, 800, 600]);
	ball = load_image("img/ball.png", [384, 284, 32, 32]);
	stick_player = load_image("img/stick.png", [718, 260, 64, 128]);
	stick_scibot = load_image("img/stick.png", [30, 260, 64, 128]);
	
	// maak een sprite object aan,
	// sprite is een extend image object met meer methodes zoals
	// move(sprite, dx, dy)
	// render(sprite, position)
	// collision(sprite1, sprite2)
	// sprite = Sprite(window, image)
	sprite_ball = Sprite(window, ball);
	sprite_player = Sprite(window, stick_player);
	sprite_scibot = Sprite(window, stick_scibot);
	
	CONST_SPEED = 15;
	speed = 15;
	delta = [-speed, 0];
	
	// zolang er niet op escape wordt geklikt...
	while ~event.poll(-27) 
		
		if is_hitting_right_bound(window, sprite_ball, delta(1)) then
			speed = CONST_SPEED;
			set_x(sprite_ball, window.width / 10 * 6 + sprite_ball.image.width / 2)
			set_y(sprite_ball, window.height / 2 - sprite_ball.image.height / 2)
			delta(1) = -speed;
			delta(2) = 0;
		elseif is_hitting_left_bound(window, sprite_ball, delta(1)) then
			speed = CONST_SPEED;
			set_x(sprite_ball, window.width / 10 * 4 - sprite_ball.image.width / 2)
			set_y(sprite_ball, window.height / 2 - sprite_ball.image.height / 2)
			delta(1) = speed;
			delta(2) = 0;
		end
		
		if collision(sprite_ball, sprite_scibot) then
			delta = bounce(sprite_ball, sprite_scibot, speed);		
		elseif collision(sprite_ball, sprite_player) then
			delta = bounce(sprite_ball, sprite_player, -speed);
		end
		
		if is_hitting_lower_bound(window, sprite_ball, delta(2)) then
			delta(2) = delta(2) * (-1)
			set_y(sprite_ball, 0);
		elseif is_hitting_upper_bound(window, sprite_ball, delta(2)) then
			delta(2) = delta(2) * (-1)
			set_y(sprite_ball, window.height - sprite_ball.image.height);
		end
		
		ps = get_position(sprite_scibot)
		pb = get_position(sprite_ball)
		if ps(2) + sprite_scibot.image.height / 4 < pb(2) - sprite_ball.image.height / 2 then
			move(sprite_scibot, 0, -speed / 2);
		elseif ps(2) + sprite_scibot.image.height / 4 * 3 > pb(2) - sprite_ball.image.height / 2 then
			move(sprite_scibot, 0, speed / 2);
		end
		
		move(sprite_ball, delta(1), delta(2));
		set_y(sprite_player, window.height - get_mouse_y() - stick_player.height / 2); 
		
		// regelt de frames per second
		tick();
	end
	
	// sluit alles mooi af
	destroy(window); 
endfunction

main();
