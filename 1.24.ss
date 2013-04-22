;Modify the timed-prime-test procedure of
;Exercise 1.22 to use fast-prime? (the Fermat method), and test
;each of the 12 primes you found in that exercise. Since the Fermat
;test has Θ(log n ) growth, how would you expect the time to test
;primes near 1,000,000 to compare with the time needed to test
;primes near 1000? Do your data bear this out? Can you explain
;any discrepancy you find?

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

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (newline) (display n) (start-prime-test n (runtime)))  

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) start-time))))
 
(define (report-prime elapsed-time)
  (display " *** ") (display elapsed-time))

(define (prime? n)
  (fast-prime? n 100))

; I would expect this to take O(1000000) for primes near 1M, O(1000) for
; primes near 1000. I cannot test the speed on a modern computer.
                                                
