; Simpson’s Rule is a more accurate method of numer-
; ical integration than the method illustrated above. Using Simp-
; son’s Rule, the integral of a function f between a and b is approxi-
; mated as
; h
; - * ( y0 + 4 y1 + 2 y2 + 4 y3 + 2 y4 + . . . + 2 yn−2 + 4 yn−1 + yn ),
; 3
; where h = (b − a)/n , for some even integer n , and yk = f (a + kh).
; (Increasing n increases the accuracy of the approximation.) Define
; a procedure that takes as arguments f , a , b , and n and returns the
; value of the integral, computed using Simpson’s Rule.
; Use your procedure to integrate cube between 0 and 1 (with n = 100 and n = 1000),
; and compare the results to those of the integral procedure shown above.
;

(define (cube x) (* x x x))

(define (simpsons-rule f a b n)
  (define h
    (/ (- b a) n))
  (define (y-succession k acc)
    (cond ((= k 0)
           (+ acc (y-value k)))
          ((= k n)
           (y-succession (- k 1) (+ acc (y-value k))))
          ((even? k)
           (y-succession (- k 1) (+ acc (* 2 (y-value k)))))
          (else
            (y-succession (- k 1) (+ acc (* 4 (y-value k)))))))
  (define (y-value k)
    (f (+ a (* k h))))
  (/ (* h (y-succession n 0)) 3))

(simpsons-rule cube 0 1 100) => ; Value: 1/4
