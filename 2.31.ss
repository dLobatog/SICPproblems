;Abstract your answer to Exercise 2.30 to produce a
;procedure tree-map with the property that square-tree could be
;defined as :
(define (square-tree tree) (tree-map square tree))

(define (tree-map procedure tree)
  (if (not (list? tree))
    (procedure tree)
    (if (null? tree)
      (list)
      (cons (procedure (car tree))
            (map (lambda (sub-tree) tree-map procedure sub-tree) (cdr tree))))))

(define (square-tree tree) (tree-map square tree))
(square-tree (list 1 (list 6) (list 7)))
(square-tree (list 1 6 7))
(square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
