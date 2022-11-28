;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname |Assignment 15|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
Digital Ready CS001
Assignment 15 - Trees 2
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

#|
The data definition for a tree of numbers,
along with an example tree of numbers,
has been provided below. It is identical
to the tree of numbers used in class.

A Node is a (make-tree Data List-of-Nodes)
- Data is the data the node is storing
- Children is the list of children nodes
|#
(define-struct node (data children))

(define NODE-5 (make-node 5 '()))
(define NODE-11 (make-node 11 '()))
(define NODE-4 (make-node 4 '()))
(define NODE-2 (make-node 2 '()))
(define NODE-10 (make-node 10 '()))
(define NODE-6
  (make-node 6 (list NODE-5 NODE-11)))
(define NODE-9
  (make-node 9 (list NODE-4)))
(define NODE-7
  (make-node 7 (list NODE-2 NODE-10 NODE-6)))
(define NODE-8
  (make-node 8 (list NODE-9)))
(define NODE-3
  (make-node 3 (list NODE-7 NODE-8)))

#| Question 1
Create a function that takes in a
tree of numbers and returns
if every number in the tree is
positive (using positive?).
|#

(define (pos-tree tr)
  (and (positive? (node-data tr))
      (ormap pos-tree (node-children tr))))
    

#| The data definition for a file
directory, and an example file directory,
has been provided below. It is identical
to the example used in lecture. |#

; A Directory is one of
; - file
; - folder

; A File is a (make-file String Number)
; Represents a file with a certain name and size in bytes
(define-struct file (name size))

; A Folder is a (make-folder String List-of-Directories)
; Represents a folder that can contain other folders or files
(define-struct folder (name directories))

(define syllabus (make-file "SyllabusCPT" 15))
(define grades (make-file "Grades" 4))
(define folder-105 (make-folder "105" (list syllabus grades)))
(define folder-103 (make-folder "103" '()))
(define placement (make-file "Placement" 10))
(define teaching
  (make-folder "Teaching" (list placement folder-103 folder-105)))
(define best-films (make-file "BestFilms" 4))
(define k10 (make-file "K10" 110))
(define research (make-folder "Research" '()))
(define my-documents
  (make-folder "My Documents" (list k10 best-films teaching research)))
(define program-files (make-folder "Program Files" '()))
(define floppy (make-folder "Floppy A:" '()))
(define local-c (make-folder "Local C:" (list program-files)))
(define local-d (make-folder "Local D:" (list my-documents)))
(define compact-disc (make-folder "Compact F:" '()))
(define my-computer
  (make-folder "My Computer" (list floppy local-c local-d compact-disc)))

#| Question 3
Create a function that takes in a file directory
and returns how many files exist in that directory,
and all of its subdirectories.
|#

(define (existing-files dir)
  (cond
    [(file? dir) 1]
    [(folder? dir) (foldr (λ (dir base) (+ (existing-files dir) base))
                    0 (folder-directories dir))]))

#| Question 4
Microsoft is working on their new file directory system,
and wants to create a new way to rename files easily.

Create the function "rename" that takes in the name
of a target file, the name to change the file to,
and the directory to search for that file in.

If the target file exists in the directory, change its name
to the target. The function should return a new
directory which is identical to the original,
except the name of the target file has been changed.

If the target file does not exist in the directory,
return "Target File Not Found".
|#

(define (rename "")