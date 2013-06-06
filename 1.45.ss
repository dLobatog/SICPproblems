; We saw in Section 1.3.3 that attempting to compute
; square roots by naively finding a fixed point of y → x /y does not
; converge, and that this can be fixed by average damping. The same
; method works for finding cube roots as fixed points of the average-
; damped y → x /y 2 . Unfortunately, the process does not work for
; fourth roots—a single average damp is not enough to make a fixed-
; point search for y → x /y 3 converge. On the other hand, if we aver-
; age damp twice (i.e., use the average damp of the average damp of
;     y → x /y 3 ) the fixed-point search does converge. Do some experi-
; ments to determine how many average damps are required to com-
; pute n th roots as a fixed-point search based upon repeated average
; damping of y → x /y n−1 . Use this to implement a simple procedure
; for computing n th roots using fixed-point, average-damp, and
; the repeated procedure of Exercise 1.43. Assume that any arith-
; metic operations you need are available as primitives

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (newline) (display guess)
      (newline) (display next)
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(fixed-point (lambda (x) (/ x (log x))) 2)

(define (compose f g)
 (lambda (x) (f (g x))))

(define (repeated f times)
 (if (= times 1)
  f
  (compose f (repeated f (- times 1)))))

(define (log2 x)
   (/ (log x) (log 2)))

(define (average x y) (/ (+ x y) 2))

(define (average-damp f)
   (lambda (x) (average x (f x))))

(define (nth-root x n)
  (fixed-point
    ((repeated average-damp (floor (log2 n)))
     (lambda (y) (/ x (expt y (- n 1)))))
    1.0))

