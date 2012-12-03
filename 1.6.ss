; Alyssa P. Hacker doesn't see why if needs to be provided as a special form. 
; ``Why can't I just define it as an ordinary procedure in terms of cond?'' she asks. 
; Alyssa's friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))
; Eva demonstrates the program for Alyssa:
(new-if (= 2 3) 0 5)
5

(new-if (= 1 1) 0 5)
0
; Delighted, Alyssa uses new-if to rewrite the square-root program:
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))
; real method - 
 (define (sqrt-iter guess x)
   (if (good-enough? guess x)
     guess
     (sqrt-iter (improve guess x)
                x))) 
; What happens when Alyssa attempts to use this to compute square roots? Explain.

(define (square x) (* x x))

(define (good-enough? guess x)
 (< (abs (- (square guess) x)) 0.001))

(define (improve guess x) (average guess (/ x guess)))

(define (average x y) (/ (+ x y) 2))

; Start by making a guess of 1 
(define (sqrt x) (sqrt-iter 1.0 x))


; New if doesn't work when recursion goes on because else-clause does never resolve.
; It is likely that when it uses regular if, it recurses lazily thus allowing us to solve
; the problem without falling in an infinite loop.
; 
; Follow-up: 'if' doesn't recurse lazily, it's a special form and evaluates differently.
