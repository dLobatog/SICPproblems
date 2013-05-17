;Demonstrate that the Carmichael numbers listed in
;Footnote 1.47 really do fool the Fermat test. That is, write a proce-
;dure that takes an integer n and tests whether a n is congruent to
;a modulo n for every a < n , and try your procedure on the given
;Carmichael numbers.

(define (expmod base exp m)
  (cond ((= exp 0)
         1)
        ((even? exp)
         (remainder
           (square
             (expmod base (/ exp 2) m))
           m))
        (else
          (remainder
            (* base
               (expmod base (- exp 1) m))
            m))))

(define (carmichael-proof n)
  (carmichael-test n (- n 1)))

(define (carmichael-test n a)
  (cond ((= a 0)
         true)
        ((= (expmod a n n) (remainder a n))
         (carmichael-test n (- a 1)))
        (else
          false)))

(carmichael-proof 561)
(carmichael-proof 1105)
(carmichael-proof 1729)
(carmichael-proof 2465)
(carmichael-proof 2821)
(carmichael-proof 6601)
