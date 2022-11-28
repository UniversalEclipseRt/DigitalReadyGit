;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Assignment 12|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Digital Ready CS002
Assignment 12 - Local and Lambda
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
Remake the (has-large-numbers?) function
from assignment 11 using list abstractions
AND a lambda expression
|#

(define (has-large-num? lon)
  (ormap(λ (num) (>= num 10)) lon))

(check-expect (has-large-num? (list 11 12 13)) #t)

#| Question 2
Create a function that filters a list of
numbers to include numbers that are both
odd and negative. Use a lambda expression.

For example,
(filter-neg-odds (list -1 2 -3 -4 5)) -> (list -1 -3)
|#

(define (fillter-negs-odds lon)
  (filter (λ (num) (and (neg? num) (odds num))) lon))

#| Question 3
Create a function that takes in a list of strings
and maps the following function to the list:

If the string is 3 or less characters long,
turn it into "Short Word"

If the string is between 3 and 8 characters long,
turn it into "Medium Word"

If the string is longer than 8 characters long,
turn it into "Long Word".

Create a local scope and define your helper
function within that local scope.
|#

#| Question 4
A company wants to create a program
that will check if a passphrase inputted
by the user is correct.

The company wants to make sure the
passphrase is only accessible in this function,
so that the passphrase can't be found
in any other part of the code.

Create a funcion that takes in a string
and checks if it matches the passphrase.

Define your passphrase within a local scope.
|#