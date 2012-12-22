;Compute the elements of a pascal triangle by means of a recursive process

; The trick here is to write the tree like
;
; 1 
; 1 1
; 1 2 1
; 1 3 3 1
; 1 4 6 4 1
;
; Then you can deduce from there that always the first element (y = 0) is 1 
; and the last element (y = x) is 1. These are the base cases. 

(define (pascal x y) 
  (cond ((or (= y 0) (= y x))1)
        (else (+ (pascal (- x 1) (- y 1))
                 (pascal (- x 1) y)))))
