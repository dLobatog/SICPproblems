; Give an implementation of adjoin-set using the
; ordered representation. By analogy with element-of-set? show
; how to take advantage of the ordering to produce a procedure that
; requires on the average about half as many steps as with the un-
; ordered representation.

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
    set
    (cond ((null? set) (list x))
          ((< x (car set)) (cons x set))
          (else (cons (car set) (adjoin-set x (cdr set)))))))

