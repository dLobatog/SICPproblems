; A function f is defined by the rule that 
;      f(n) = n if n<=3 
;      f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3
;
; Write a procedure that computes f by means of a recursive process. 

(define (f n)
  (if (< n 3) n
    (if (>= n 3) (+  (f (- n 1)) 
                    (* 2 (f (- n 2)))
                    (* 3 (f (- n 3)))))))

; Write a procedure that computes f by means of an iterative process.
; i.e: use a counter.
;
; The counter will build up f(n) from f(1)  

(define (f n)
  (if (< n 3)
    n
    (iter-f 2 1 0 n)))
    
(define (iter-f a b c counter)
  (if (< counter 3) 
    a
    (iter-f (+ a (* b 2) (* c 3)) a b (- counter 1))))

