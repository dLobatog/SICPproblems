; Define a better version of make-rat that handles both
; positive and negative arguments. Make-rat should normalize the
; sign so that if the rational number is positive, both the numerator
; and denominator are positive, and if the rational number is nega-
; tive, only the numerator is negative.

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))
(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define make-rat cons)
(define numer car)
(define denom cdr)

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

;Divide the numerator and denominator by the greatest common divisor
;with its sign fixed to be the same as the denominator's sign

(define (make-rat n d)
  (let
    ((div ((if (< d 0) - +) (abs (gcd n d)))))
    (cons (/ n div) (/ d div))))
