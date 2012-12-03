;The good-enough? test used in computing square roots will not be very effective
;for finding the square roots of very small numbers.  Also, in real computers,
;arithmetic operations are almost always performed with limited precision.
;This makes our test inadequate for very large numbers.  Explain these
;statements, with examples showing how the test fails for small and large
;numbers. 

;Essentially testing for very large or very small values of X, deals with the 
;innacuracies of floating-point representation.

;An alternative strategy for implementing good-enough? is to watch how guess
;changes from one iteration to the next and to stop when the change is a very
;small fraction of the guess. Design a square-root procedure that uses this kind
;of end test. Does this work better for small and large numbers?
                           
(define (sqrt-iter guess x old-guess) 
  (if (good-enough? guess old-guess)
    guess
    (sqrt-iter (improve guess x)
               x
               guess))) 

(define (square x) (* x x))

(define (good-enough? guess old-guess)
  (< (/ (change guess old-guess) old-guess) 0.001))

(define (change guess old-guess)
  (abs (- guess old-guess)))

(define (improve guess x) (average guess (/ x guess)))

(define (average x y) (/ (+ x y) 2))

; Start by making a guess of 1 
(define (sqrt x) (sqrt-iter 1.0 x 0.0))

