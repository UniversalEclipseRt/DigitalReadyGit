;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Assignment 10|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Digital Ready CS002
Assignment 10 - Lists and Recursion
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
Create the following lists:

- An empty list called MT-LIST
- A list called LIST-1 with 3 cons-ed to MT-LIST
- A list called LIST-2 with 2 cons-ed to LIST-1
- A list called LIST-3 with 1 cons-ed to LIST-2
- A list called "NAMES" with at least 3 names.

|#

(define MT-LIST '())
(define LIST-1 (cons 3 MT-LIST))
(define LIST-2 (cons 2 LIST-1))
(define LIST-3 (cons 1 LIST-2))
(define NAMES (list "ryan" "caleb" "jose"))

#| Question 2
Create a function called (list-product)
that takes in a list of numbers
and multiplies all the numbers

For example,
(list-product (list 1 2 3)) -> 6
|#

(define (list-product lon)
  (cond
    [(empty? lon) 1]
    [(cons? lon) (* (car lon)
                    (list-product (cdr lon)))]))

#| Question 3
Create a function called (all-caps)
that takes in a list of Strings
and returns a new list of Strings
where all the words are fully capitalized

Hint: The function (string-upcase)
send a string to all caps

For example,
(all-caps (list "George" "Potassium")) -> (list "GEORGE "POTASSIUM")
|#

(define (all-caps lon)
  (cond
    [(empty? lon) '()]
    [(cons? lon) (cons
                  (string-upcase (car lon))
                 (all-caps (cdr lon)))]))

(check-expect (all-caps NAMES) (list "RYAN" "CALEB" "JOSE"))

#| Question 4
Create a function called (has-large-numbers?)
that takes in a list of numbers
and returns if the list
contains any numbers greater than 10

For example,
(has-large-numbers? (list 1 2 5 12 41)) -> #true
(has-large-numbers? (list 1 2 4)) -> #false
|#

(define (has-large-numbers? lon)
  (cond
    [(empty? lon) '()]
    [(cons? lon) (cons
                  (> (car lon) 10)
                  (has-large-numbers? (cdr lon)))]))

(check-expect (has-large-numbers? (list 20 30 40)) #t)
(check-expect (has-large-numbers? (list 2 3 4)) #f)

#| Question 5
Now that we have lists in our toolkit,
we can create a more thorough definition
of a student structure.

Create a new student structure that contains
a name, student id, and a list of grades
that correspond to their classes (ex. 86, 79, 92)

Create at least 2 examples of students
|#

(define stu-1-grade (list 73 100 67))
(define stu-2-grade (list 93 76 80))

(define-struct student (name id grades))
(define stu1 (make-student "Luna" 1 stu-1-grade))
(define stu2 (make-student "Sol" 2 stu-2-grade))

#| Question 6
Create a function called (get-gpa)
that takes in a student and calculates
their gpa.

Hint: Calculate their GPA by
taking the sum of their grades,
then dividing by the number
of classes they are taking.
You may want to do this in
two seperate functions.
|#

#| Question 7
A "Classroom" contains a
room number, teacher name
and a list of students.

The structure definition for
a classroom has been made for you below:
|#
(define-struct classroom (room teacher students))
#|
Create at least one example of a classroom.

A professor would like to make a function
to identify students that need more help
in their classes.

Create a function called (filter-grades)
that takes in a classroom
and returns a list of students who have
a GPA less than 70.
|#
    