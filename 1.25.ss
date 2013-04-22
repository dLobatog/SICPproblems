;Alyssa P Hacker complains that we went to a lot of
;extra work in writing expmod. After all, she says, since we already
;know how to compute exponentials, we could have simply written

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))
 
(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

;Is she correct? Would this procedure serve as well for our fast prime
;tester? Explain

; Yes, both will produce equivalent results. In fact the only difference
; is that Alyssa's expmod defers the call to remainder, while expmod computes 
; it immediately.
; Nonetheless this makes Alyssa's expmod deal with much bigger intermediate 
; results than expmod, where the computations never have to handle numbers greater
; than m.
; This renders Alyssa's expmod much slower than expmod.
