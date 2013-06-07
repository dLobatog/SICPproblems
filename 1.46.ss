; Several of the numerical methods described in
; this chapter are instances of an extremely general computational
; strategy known as iterative improvement. Iterative improvement
; says that, to compute something, we start with an initial guess
; for the answer, test if the guess is good enough, and otherwise
; improve the guess and continue the process using the improved
; guess as the new guess.
; Write a procedure iterative-improve that takes two procedures
; as arguments: a method for telling
; whether a guess is good enough and a method for improving a
; guess. Iterative-improve should return as its value a procedure
; that takes a guess as argument and keeps improving the guess
; until it is good enough. Rewrite the sqrt procedure of Section
; 1.1.7 and the fixed-point procedure of Section 1.3.3 in terms of
; iterative-improve.

(define (sqrt x)
  ((iterative-improve good-enough?
                      improve)
   1.0))

(define (fixed-point f first-guess)
  ((iterative-improve (lambda (guess)
                        (< (abs (- (f guess) guess))
                           0.00001))
                      (lambda (guess)
                        (f guess)))
   first-guess))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (iterative-improve good-enough improve-guess)
  (define (improve guess)
    (if (good-enough? guess)
      guess
      (improve (improve-guess guess))))
  improve)

