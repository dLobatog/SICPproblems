; Give a O(n) implementation of union-set for sets represented as ordered
; lists.

(load "2.61.ss")

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (union-set (cdr set1) (adjoin-set (car set1) set2)))))
