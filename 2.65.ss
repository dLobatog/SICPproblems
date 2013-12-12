; Use the results of Exercise 2.63 and Exercise 2.64 to
; give Θ( n ) implementations of union-set and intersection-set
; for sets implemented as (balanced) binary trees.

(define (union-set tree1 tree2)
  (define (union-list set1 set2)
    (cond ((null? set1) set2)
          ((null? set2) set1)
          ((= (car set1) (car set2))
           (cons (car set1) (union-list (cdr set1) (cdr set2))))
          ((< (car set1) (car set2))
           (cons (car set1) (union-list (cdr set1) set2)))
          (else (cons (car set2) (union-list set1 (cdr set2))))))
  (list->tree (union-list (tree->list-2 tree1)
                          (tree->list-2 tree2))))

(define (intersection-set tree1 tree2)
  (define (intersection-list set1 set2)
    (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1
                     (intersection-list (cdr set1)
                                        (cdr set2))))
              ((< x1 x2)
               (intersection-list (cdr set1) set2))
              ((< x2 x1)
               (intersection-list set1 (cdr set2)))))'))
  (list->tree (intersection-list (tree->list-2 tree1)
                                 (tree->list-2 tree2))))

