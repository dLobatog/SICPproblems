; A continued fraction representation of the tangent
; function was published in 1770 by the German mathematician J.H.
; Lambert:
;
; tan x =       x
;         --------------
;         1 -   x^2
;             ----------
;             3 - x^2
;                ------
;                5 -...
;
;   where x is in radians. Define a procedure (tan-cf x k) that com-
;   putes an approximation to the tangent function based on Lam-
;   bert’s formula. k specifies the number of terms to compute, as in
;   Exercise 1.37.

(define (cont-frac n d k)
  (if (= k 0)
    1
    (/ (n k) (+ (d k) (cont-frac n d (- k 1))))))


(define (tan-cf x k)
  (define (n k)
    (if (= k 1)
      x
      (- (square x))))
  (define (d k)
    (- (* 2 k) 1))
  (cont-frac n d k))
