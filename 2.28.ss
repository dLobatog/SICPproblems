; Write a procedure fringe that takes as argument a
; tree (represented as a list) and returns a list whose elements are all
; the leaves of the tree arranged in left-to-right order. For example,
; (define x (list (list 1 2) (list 3 4)))
; (fringe x)
; (1 2 3 4)
; (fringe (list x x))
; (1 2 3 4 1 2 3 4)

; Solution: Follow a similar procedure as that of counting leaves, that is,
; checking whether the current node is a leaf or not, and recurse.

(define (fringe tree)
  (cond ((null? tree) tree)
        ((not (pair? tree)) (list tree))
        (else (append (fringe (car tree)) (fringe (cdr tree))))))
