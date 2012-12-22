(define (even? n)
  (= (remainder n 2) 0))

(define (square n) (* n n))

(define (exp b n) 
  (iter-exp b n 1))
 
(define (iter-exp b n a)
  (cond ((= n 0) a)
        ((even? n) (iter-exp (square b) (/ n 2) a))
        (else (iter-exp b (- n 1) (* a b)))))
