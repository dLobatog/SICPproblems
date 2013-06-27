; Ben Bitdiddle, an expert systems programmer, looks
; over Alyssa’s shoulder and comments that it is not clear what it
; means to divide by an interval that spans zero. Modify Alyssa’s code
; to check for this condition and to signal an error if it occurs.
(define (contains-zero? x)
  (and (>= 0 (upper-bound x)) (<= 0 (lower-bound x))))

(define (div-interval x y)
  (if (contains-zero? y)
    (error "Error: The divisor interval spans 0")
    (mul-interval
      x
      (make-interval (/ 1.0 (upper-bound y))
                     (/ 1.0 (lower-bound y))))))
