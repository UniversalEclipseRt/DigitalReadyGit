;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Assignment 7|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Digital Ready CS002
Assignment 7 - Structures
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

#| Question 1:
Define a new structure called "address"

An address should have a number, street, and town.

Follow the complete design recipe for data,
including a definition, interpretation,
and appropriate examples to recieve full credit.
|#

; An Address is a (make-address Number String String)

; An Address represents where someone lives
; - number is the number of the building
; - street is the name of the street the building is on
; - town is the name of the town the building resides

(define-struct address (number street town))

(define ryan-address (make-address 108 "Streetington St" "Hyde Park"))
(define chris-address (make-address 101 "Random St" "Boston"))
(define bob-address (make-address 95 "Random St" "Random Town"))

#| Question 2:
Fill in the blanks with the correct functions:
|#

; The function to create a new address is: _(make-address (number street town))_
; The function to access the number of an address is: _(define-number)_
; The function to access the street of an address is: _(define-street)_
; The function to access the town of an address is: _(define-town)_

#| Question 3:
If a house number is even, it is on the left side of the street.
If a house number is odd, it is on the right side of the street.

Make a function called "street-side" that takes in an address
and returns "Left" if the house is on the left side of the street,
and "Right" if the house is on the right side of the street.

Hint: You can use the functions (odd? num) or (even? num)
to determine is a number is even or odd.
|#

; If a house's number is even on the left side of the street,
; odd right side of the street.


(define (street-side address)
  (if(even? (address-number address)) "Left" "Right"))

(check-expect (street-side ryan-address) "Right")
(check-expect (street-side chris-address) "Left")

#| Question 4:
Define a new structure called "Student"

A student should have a name, gpa and address.
|#

; A Student is a (make-student Name gpa address)

; A Student represents a student in school
; - name is the name of the student
; - gpa is the gpa of the student
; - address is the address of the student

(define-struct student (name gpa address))

(define student-ryan (make-student "Ryan" 3.4 ryan-address))
(define student-chris (make-student "Chris" 2.5 chris-address))
(define student-bob (make-student "Bob" 4.0 bob-address))

#| Question 5:
Two students are neighbors if they live on the same street
and within 20 house numbers of eachother.

Create a function called "neighbors?" that takes in two students
and returns if they are neighbors.
|#

(define (neighbor? student1 student2)
  (if (and (string=? (address-street (student-address student1)) (address-street (student-address student2))
      (<= student-address-number 20 address1) (<= student-address-number 20 address2)) "neighbors"))

(check-expect (neighbor? ryan-address chris-address) "neighbors")
#| Bonus Question:
Create a structure called "coordinate"
that has an x value and y value.

Create a function called "distance-formula"
that takes in two coordinates and calculates
the distance between them.

Hint: If two points are (x1, y1), (x2, y2),
the distance between them is
(sqrt ((x2 - x1)^2 + (y2 - y1)^2))
|#