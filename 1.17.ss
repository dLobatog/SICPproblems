;The exponentiation algorithms in this section are
;based on performing exponentiation by means of repeated multi-
;plication. In a similar way, one can perform integer multiplication
;by means of repeated addition. The following multiplication pro-
;cedure (in which it is assumed that our language can only add, not
;    multiply) is analogous to the expt procedure:
(define (* a b)
  (if (= b 0)
    0
    (+ a (* a (- b 1)))))
;This algorithm takes a number of steps that is linear in b. Now sup-
;pose we include, together with addition, operations double, which
;doubles an integer, and halve, which divides an (even) integer by
;2. Using these, design a multiplication procedure analogous to
;fast-expt that uses a logarithmic number of steps.
(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

; Solution

(define (even? n)
   (= (remainder n 2) 0))

(define (double n)
  (* 2 n))

(define (halve n)
  (/ n 2)) 

(define (my-mult a b)
  (cond ((even? b) (my-mult 2 (my-mult a (halve b))))
        (else (+ a (* a (- b 1))))))

; a * b = 2a * (b/2) - even
; a * b = a + a *(b-1) - odd
