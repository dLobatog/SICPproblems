; Show that we can represent pairs of nonnegative inte-
; gers using only numbers and arithmetic operations if we represent
; the pair a and b as the integer that is the product 2^a * 3^b.
; Give the corresponding definitions of the procedures cons, car, and cdr

; Solution:
; Decompose the pair until necessary. A helper function count-divisors helps
; not repeating the same code in car and cdr.

(define (pair a b)
 (* (expt 2 a) (expt 3 b)))

(define (count-divisors dividend divisor count)
  (if (= (remainder dividend divisor) 1)
    count
    (count-divisors (/ dividend divisor) divisor (+ 1 count))))

(define (car pair) (count-divisors pair 2 0))
(define (cdr pair) (count-divisors pair 3 0))
