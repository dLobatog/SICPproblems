; Using reasoning analogous to Alyssa’s, describe how
; the difference of two intervals may be computed. Define a corre-
; sponding subtraction procedure, called sub-interval.

; This requires x to be strictly greater than y
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))
