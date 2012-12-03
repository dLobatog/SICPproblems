; Cube root using non-general Newton's method

(define (cbrt-iter guess x old-guess) 
  (if (good-enough? guess old-guess)
    guess
    (cbrt-iter (improve guess x)
               x
               guess))) 

(define (square x) (* x x))

(define (good-enough? guess old-guess)
  (< (/ (change guess old-guess) old-guess) 0.001))

(define (change guess old-guess)
  (abs (- guess old-guess)))

(define (improve guess x) 
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

; Start by making a guess of 1 
(define (cbrt x) (cbrt-iter 1.0 x 0.0))
 
