(define (p) (p))

(define (test x y)
  (if (= x 0) 
      0
      y))

(test 0 (p))

; Normal order
; 
; (test 0 (p))
; (if (= 0 0) 0 (p))
; 0
;
; Applicative order
;
; Will be stuck on an infinite recursive loop evaluating (p) to (p)
