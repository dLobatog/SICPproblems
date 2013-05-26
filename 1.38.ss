; In 1737 the Swiss mathematician Leonhard Euler
; published a memoir De Fractionibus Continuis, which included a
; continued fraction expansion for e − 2, where e is the base of the
; natural logarithms. In this fraction, the Ni are all 1, and the D i are
; successively 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, . . . . Write a program that
; uses your cont-frac procedure from Exercise 1.37 to approximate
; e , based on Euler’s expansion.

(define (cont-frac n d k)
  (if (= k 0)
    (/ (n k) (+ (d k)))
    (/ (n k) (+ (d k) (cont-frac n d (- k 1))))))

(define (e-approximation k)
  (define (d i)
    (let ((rem (remainder i 3)))
      (if (or (= rem 0) (= rem 1))
        1
        (* 2 (+ 1 (quotient i 3))))))

  (+ 2 (cont-frac (lambda (x) 1.0) d k)))
