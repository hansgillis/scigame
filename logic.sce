function __ret__ = bounce(ball, stick, speed)
	__ret__ = zeros(2);
	ball_rectangle = get_rectangle(ball)
	stick_rectangle = get_rectangle(stick)
	relative_intersection_y = (stick_rectangle(2) + (stick_rectangle(4) / 4)) - (ball_rectangle(2) - ball_rectangle(4) / 2);
	angle = (relative_intersection_y / (stick_rectangle(4) / 2));
	
	__ret__(1) = speed * cos(angle);
	if speed < 0 then
		__ret__(2) = speed * (-sin(angle));
	else
		__ret__(2) = -speed * (-sin(angle));
	end
	
endfunction

function __ret__ = is_hitting_lower_bound(window, ball, dy)
	__ret__ = %F;
	ball_rectangle = get_rectangle(ball);
	if 0 > ball_rectangle(2) + dy then
		__ret__ = %T;
	end
endfunction

function __ret__ = is_hitting_upper_bound(window, ball, dy)
	__ret__ = %F;
	ball_rectangle = get_rectangle(ball);
	if ball_rectangle(2) + dy + ball_rectangle(4) > window.height then
		__ret__ = %T;
	end
endfunction

function __ret__ = is_hitting_left_bound(window, ball, dx)
	__ret__ = %F;
	ball_rectangle = get_rectangle(ball);
	if 0 > ball_rectangle(1) + dx + ball_rectangle(3) then
		__ret__ = %T;
	end
endfunction

function __ret__ = is_hitting_right_bound(window, ball, dx)
	__ret__ = %F;
	ball_rectangle = get_rectangle(ball);
	if ball_rectangle(1) + dx > window.width then
		__ret__ = %T;
	end
endfunction