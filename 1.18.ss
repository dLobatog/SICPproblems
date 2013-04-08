;Using the results of Exercise 1.16 and Exercise 1.17,
;devise a procedure that generates an iterative process for multiply-
;ing two integers in terms of adding, doubling, and halving and uses
;a logarithmic number of steps.

(define (even? n)
   (= (remainder n 2) 0))

(define (double n)
  (* 2 n))

(define (halve n)
  (floor (/ n 2))) 

; Okay, this is tricky. The way this multiplication works is called the russian peasant
; method. It boils down to writing 2 columns, doubling the left one and halving the right one
; until the right one is 1. Then add all the whole left column except the ocurrences 
; where the right-column number is even. Quick example: 8 * 5
;
; 8    5 
; 16   2 -- DONT ADD
; 32   1
; --
; 32 + 8 = 40

(define (mult a b) 
  (my-mult a b 0))

(define (my-mult a b acc)
  (cond ((= b 1) (+ a acc)) 
        ((even? b) (my-mult (double a) (halve b) acc))
        (else (my-mult (double a) (halve b) (+ a acc)))))


