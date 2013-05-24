; Show that the golden ratio φ (Section 1.2.2) is a fixed
; point of the transformation x → 1 + 1/x , and use this fact to com-
; pute φ by means of the fixed-point procedure.

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1) ;Value: 987/610 ~ 1.618
