;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Assignment 9 - Big Bang Project|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Digital Ready CS001
Assignment 9 - Big Bang Project
Submit on Google Classroom by Wednesday at 5:00PM

If a question asks you to make a function,
it must follow the complete design recipe
including a purpose statement, signature
and appropriate tests to recieve full credit

If a question asks you to make a structure,
it must follow the complete design recipe
including a definition, interpretation,
and appropriate examples to recieve full credit
|#

#|
For this assignmnet,you will make a simple game called "Parachute".
In "Parachute", you control a parachuter falling
from the top of the screen. At the bottom of the
screen, there is a platform that automatically moves
from left to right. Your goal is to land
on this platform to win.
|#

; These libraries are required for big-bang
; and image processing
(require 2htdp/universe)
(require 2htdp/image)

#| Problem 1:
Design data for a "parachuter".
A parachuter will need a current x,y position.
|#


(define-struct parachuter (x y))
(define PARACHUTER-START (make-parachuter 250 200))

#| Problem 2:
Design data for a "platform".
Since the platform only moves from left to right,
it will only need an x position. Also include
a boolean called "left?" that is #true if the
platform is currently moving to the left,
and #false if the platform is currently moving
to the right. This will make our on-tick functionality
much easier later.
|#

(define-struct platform (x left?))
(define PLATFORM-START (make-platform 250 #t))

#| Question 3
Design data for a "World"
that contains the parachuter and the platform.
|#
;
(define-struct world (parachuter platform))
(define WORLD-START (make-world PARACHUTER-START PLATFORM-START))

#| Question 4
Design your "on-key" function.
If you press "left" on your keyboard,
the parachuter should move to the left.
If you press "right" on your keyboard,
the parachuter should move to the right.

You will need to include code to prevent
your parachuter from going beyond the
edges of the screen. i.e., if your parachuter
is already hugging the left side of the screen,
they should not be allowed to move any
further left, and vice versa for the right side.
|#

(define (move-parachuter par amt)
  (if (or (< (+ (parachuter-x par) amt) 0)
          (> (+ (parachuter-x par) amt) 500))
      par
      (make-parachuter (+ (parachuter-x par) amt)
                       (parachuter-y par))))



(define (key-control world key)
  (cond
    [(key=? key "left") (make-world
                         (make-parachuter (world-parachuter world) -2)
                         (world-platform world))]
    [(key=? key "right") (make-world
                         (make-parachuter (world-parachuter world) 2)
                         (world-platform world))]
    [else world]))

#| Question 5:
Design your "on-tick" function.

Every tick, the parachuter should descend one pixel downwards.

Every tick, the platform should move one pixel
in the direction it is currently moving.

If the platform collides with a wall, its direction
should be reversed.
|#

(define (parachuter-fall par)
  (make-parachuter (parachuter-x par)
                   (+ (parachuter-y par) 1)))

(define (move-platform plat)
  (cond
      [(= 0 (platform-x plat)) (make-platform
                                (+ (platform-x plat) 1)
                                (not (platform-left? plat)))]
      [(= 500 (platform-x plat)) (make-platform
                                 (- (platform-x plat) 1)
                                   (not (platform-left? plat)))]
    [(platform-left? plat) (make-platform (- ( platform-x plat) 1)
                                        (platform-left? plat))]
     [else (make-platform (+ (platform-x plat) 1)
                           (platform-left? plat))]))

(define (tick-world world)
  (make-world (parachuter-fall (world-parachuter world))
              (move-platform (world-platform world))))
  
  

#| Question 6:
Design your "to-draw" function.

The game should be rendered on a white
background that is 500x1000 pixels large,
as has been defined below.

The game should render the parachuter
at its current x,y position and the platform
at its current x position and constant height.

Define sprites for the parachuter and platform
to use in your drawing.
|#
(define BACKGROUND (empty-scene 500 800))
(define PARACHUTER-SPRITE (triangle 25 "solid" "coral"))
(define PLATFORM-SPRITE (rectangle 30 10 "solid" "peru"))

(define (draw-world world)
  (place-image PLATFORM-SPRITE
               (platform-x (world-platform world))
               780
  (place-image PARACHUTER-SPRITE
               (parachuter-x (world-parachuter world))
               (parachuter-y (world-parachuter world))
               BACKGROUND)))
#| Question 7:
Design your "stop-when" function.
The game should stop if the parachuter successfully
lands on the platform OR if the parachuter misses
the platform.
|#

(define (lose? world)
  (= (parachuter-y (world-parachuter world)) 800))

(define (win? world)
  (and (= (parachuter-y (world-parachuter world)) 780)
       
       (and (> (parachuter-x (world-parachuter world))
              (- (platform-x (world-platform world)) 10))
          (< (parachuter-x (world-parachuter world))
              (+ (platform-x (world-platform world)) 10)))))

(define (end-game? world)
  (or (win? world) (lose? world)))
              

#| Question 8:
Design an end-scene function to
display when the game is over.

If the parachuter landed on the platform,
it should display "You Win!".

If the parachuter misses the platform,
it should display "You Lose!".
|#

(define(end-scene world)
  (if (win? world)
      (place-image (text "You Win!" 50 "black")
                   250 500 (draw-world world))
      (place-image (text "You Lose" 50 "black")
                   250 500 (draw-world world))))

#| Question 9
Create your big-bang function.
Name the function "parachute"
and place all your handler functions
in the appropriate spaces.
|#

(define (parachute world)
  (big-bang world
    [on-key key-control]
    [on-tick tick-world]
    [to-draw draw-world]
    [stop-when end-game? end-scene]))


#| Question 10
Play your game!
Make starter data including a
starting parachuter towards the top
of the screen and a starter
platform at the middle of the screen.
Make a starter world that contains
your parachuter and platform
and play your game.
|#

#| Bonus
Add additional features to your game!
- Add a number of lives to your world.
  If the player loses but still has more lives,
  get rid of one life and respawn the parachuter
  at the top of the screen.
- Add a score counter to your world.
  Add a point every time the parachuter successfully lands
- Add any additional features you can think of! Examples:
  - Multiple platforms
  - Obstacles for the parachuter to avoid
  - A modifier for the parachuter's speed.
    (if holding a key, the left/right movement is faster)
|#