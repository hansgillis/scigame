# scigame
create games with scilab
-------
Scigame is a collection of utility methods to create simple games in scilab like Pong <br/>
Please, do NOT take this library serious because Scilab is not meant for game development...
TODO
-------
fix the problems with flipped y dimension
API
-------
import the init file
* exec("scigame/init.sce")

Window Class
* window = Window([width, height]) __//creates a Window object__
* destroy(window) __//closes the window__ 
* properties
    - width
    - height
    - screen (graphic window 0)

Event Class
* don't create an Event object, it already has been done in the __init__ file
* get_mouse_x()
* get_mouse_y() __// the y-dimension is flipped, window.height - get_mouse_y() to flip it correctly__
* event.poll(ascii) __// returns if the key has been pressed (negative ascii for released)__

Time Class
* don't create a Time object, it already has been done in the __init__ file
* tick() __//runs at 64 frames per second__

Image Class
* image = Image(pathfile, [x, y, width, height]) __//creates an Image object__
* blit(window, image, position) __//displays the image (top-left corner = (0, 0))__ 
* properties
    - x __//first x coordinate__ 
    - y __//first y coordinate__ 
    - width
    - height
    - control __//uicontrol__ 
    
Sprite Class
* sprite = Sprite(window, image) __//creates an Image object__
* move(sprite, dx, dy) __//moves the sprite with delta x and delta y__
* render(sprite, position) __//displays the image (top-left corner = (0, 0))__ 
* get_size(sprite) __// returns [width, height]__ 
* get_position(sprite) __// returns [current x, current y]__
* get_rectangle(sprite) __// returns [current x, current y, width, height]__ 
* collision(sprite1, sprite2) __// returns if collision has occurred between 2 sprites__
* set_y(sprite, y) __// the y-dimension is flipped, window.height - y to flip it correctly__
* set_x(sprite, x)
* properties
    - window
    - image
