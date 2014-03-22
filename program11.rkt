#lang racket
;Anthony Mace CSC240 3/21/14
;Program 11
;This program allows you to access and change
;cell contents in a matrix, recursively.

(define (getCell matrix row column)
  (if (null? matrix)
      '()
      (if (= row 1)
          (getItem (car matrix) column)
          (getCell (cdr matrix) (- row 1) column)
      )
   )
)

(define (getItem myRow column)
  (if (null? myRow)
      '()
      (if (= column 1)
          (car myRow)
          (getItem (cdr myRow) (- column 1))
      )
   )
)

(define (setCell matrix row column item)
  (if (null? matrix)
      '()
      (if (= row 1)
          (cons (setItem (car matrix) column item) (cdr matrix))
          (cons 
           (car matrix)
           (setCell (cdr matrix) (- row 1) column item)
          )
      )
   )
)

(define (setItem myRow column item)
  (if (null? myRow)
      '()
      (if (= column 1)
          (cons item (cdr myRow))
          (cons 
           (car myRow) 
           (setItem (cdr myRow) (- column 1) item)
          )
      )
   )
)

(getCell '((2 4 6 8) (1 3 5 7) (2 9 0 1)) 3 2)
(setCell '((2 4 6 8) (1 3 5 7) (2 9 0 1)) 2 5 3)