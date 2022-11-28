;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Assignment_1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Digital Ready CS002
Assignment 1 - Data
Submit on Google Classroom by the end of class.
|#

#|
Question 1:
In a single line comment, please write your name and today's date.
|#

;Ryan September 14, 2022

#|
Question 2 (Answer in a comment):
What are the two possible values of a bit?
How many bits are in a byte?
|#

; 0 or 1
; 8 bit

#|
Question 3 (Answer in a comment):
What word describes data that can be changed after it is created?
What word describes data that CAN'T be changed after it is created?
Which of those types of data does Racket use?
|#

#|
muteable
imuteable
characters, string, integer, boolen, float
|#

#|
Question 4 (Anser in a comment)
What is a boolean, and what values can it be?
|#

#|
True or False
|#

#|
Question 5:
Define the following data:
- Create a variable called FIRST-NAME that stores your first name
- Create a variable called LAST-NAME that stores your last name
- Create a variable called AGE that stores your age
|#

(define FIRST-NAME "Ryan")
(define LAST-NAME "Toledo")
(define AGE 20)

#|
Question 6:
Using the string concatenation operator (string-append), write a line of code
that produces the following text and stores it as a variable called INTRODUCTION:
"My name is *YOUR FIRST NAME* *YOUR LAST NAME*, and I am *YOUR AGE* years old."
You should NOT write your name or age in this line of code -
instead, reference the data you created in question 2.
|#

(define INTRODUCTION: (string-append "My name is " (string-append FIRST-NAME " " LAST-NAME ", and I am " (number->string AGE)) " years old."))

#|
Question 7:
Write a line of code that produces the length of INTRODUCTION
|#

(string-length INTRODUCTION:)

#|
Question 8:
Complete the following math operations in code:
- Multiply your age by 10, then store the data as a variable called N1
- Subtract 20 from N1 and divide it by 5, then store the data as a variable called N2
- Add 4 to N2 and divide it by 2, then store the data as a a variable called N3
What is the value of N3?
|#

(define N1 (* AGE 10))
(define N2 (/ (- N1 20) 5))
(define N3(/ (+ N2 4) 2))
; 20

#|
Bonus Question (Answer in a comment):
Where does the name "Boolean" come from?
|#