;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Assignment 11|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Digital Ready CS002
Assignment 11 - List Abstractions
Submit on Google Classroom by the end of class.

If a question asks you to make a function,
it must follow the complete design recipe
including a purpose statement, signature
and appropriate tests to recieve full credit

If a question asks you to make a structure,
it must follow the complete design recipe
including a definition, interpretation,
and appropriate examples to recieve full credit
|#

#| Question 1
Briefly state all of the list abstractions,
and what their purposes are
|#

#|
Map signature: (X -> Y) List-of-X -> List-of-Y

Andmap signature: (X -> Boolean) List-of-X -> Boolean

Ormap signature: (X -> Boolean) List-of-X -> Boolean

Foldr signature: (X Y -> Y) Y List-of-X -> Y

Foldl signature: (X Y -> Y) Y List-of-X -> Y

Filter signature: (X -> Boolean) List-of-X -> List-of-X
|#

#| Question 2
Remake the (list-product) function
from assignment 10 using list abstraction.
|#

(define (list-product los)
  (foldr * 1 los))

(check-expect (list-product (list 1 2 3)) 6)

#| Question 3
Remake the (all-caps) function
from assignment 10 using list abstraction
|#

(define (all-caps los)
  (map string-upcase los))

(check-expect (all-caps (list "blue" "snow" "summer")) (list "BLUE" "SNOW" "SUMMER"))

#| Question 4
Remake the (has-large-numbers?) function
from assignment 10 using list abstraction

Hint: You will need to make a helper function
|#

(define (has-large-numbers? lon)
  (ormap ((< has-large-numbers? 10) lon)))

(check-expect (has-large-numbers 10 20 30) #t)
(check-expect (has-large-numbers 1 2 3) #f)

#| Question 5
Here is the student structure you made in assignment 10:
|# (define-struct student (name id grades)) #|
Remake the (get-gpa) function
from assignment 10 using list abstraction
|#

#| Question 6
Here is the classroom structure as defined in assignment 10:
|# (define-struct classroom (room teacher students)) #|
Remake the (filter-grades) function
from assignment 10 using list abstraction
|#