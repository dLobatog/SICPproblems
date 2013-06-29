; In passing, Ben also cryptically comments: “By test-
; ing the signs of the endpoints of the intervals, it is possible to break
; mul-interval into nine cases, only one of which requires more
; than two multiplications.” Rewrite this procedure using Ben’s sug-
; gestion.

(define (is-negative? x) (<= x 0))
(define (is-positive? x) (<= x 0))

(define (mul-interval x y)
  (let ((xlo (lower-bound x))
        (xhi (upper-bound x))
        (ylo (lower-bound y))
        (yhi (upper-bound y)))
    (cond ((and (>= xlo 0)
                (>= xhi 0)
                (>= ylo 0)
                (>= yhi 0))
           ; [+, +] * [+, +]
           (make-interval (* xlo ylo) (* xhi yhi)))
          ((and (>= xlo 0)
                (>= xhi 0)
                (<= ylo 0)
                (>= yhi 0))
           ; [+, +] * [-, +]
           (make-interval (* xhi ylo) (* xhi yhi)))
          ((and (>= xlo 0)
                (>= xhi 0)
                (<= ylo 0)
                (<= yhi 0))
           ; [+, +] * [-, -]
           (make-interval (* xhi ylo) (* xlo yhi)))
          ((and (<= xlo 0)
                (>= xhi 0)
                (>= ylo 0)
                (>= yhi 0))
           ; [-, +] * [+, +]
           (make-interval (* xlo yhi) (* xhi yhi)))
          ((and (<= xlo 0)
                (>= xhi 0)
                (<= ylo 0)
                (>= yhi 0))
           ; [-, +] * [-, +]
           (make-interval (min (* xhi ylo) (* xlo yhi))
                          (max (* xlo ylo) (* xhi yhi))))
          ((and (<= xlo 0)
                (>= xhi 0)
                (<= ylo 0)
                (<= yhi 0))
           ; [-, +] * [-, -]
           (make-interval (* xhi ylo) (* xlo ylo)))
          ((and (<= xlo 0)
                (<= xhi 0)
                (>= ylo 0)
                (>= yhi 0))
           ; [-, -] * [+, +]
           (make-interval (* xlo yhi) (* xhi ylo)))
          ((and (<= xlo 0)
                (<= xhi 0)
                (<= ylo 0)
                (>= yhi 0))
           ; [-, -] * [-, +]
           (make-interval (* xlo yhi) (* xlo ylo)))
          ((and (<= xlo 0)
                (<= xhi 0)
                (<= ylo 0)
                (<= yhi 0))
           ; [-, -] * [-, -]
           (make-interval (* xhi yhi) (* xlo ylo))))))

; After debugging her program, Alyssa shows it to a potential user,
; who complains that her program solves the wrong problem. He
; wants a program that can deal with numbers represented as a cen
; ; ter value and an additive tolerance; for example, he wants to work
; with intervals such as 3.5 ± 0.15 rather than [3.35, 3.65]. Alyssa re-
; turns to her desk and fixes this problem by supplying an alternate
; constructor and alternate selectors:

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))135

; Unfortunately, most of Alyssa’s users are engineers. Real engineer-
; ing situations usually involve measurements with only a small un-
; certainty, measured as the ratio of the width of the interval to the
; midpoint of the interval. Engineers usually specify percentage tol-
; erances on the parameters of devices, as in the resistor specifica-
; tions given earlier.
