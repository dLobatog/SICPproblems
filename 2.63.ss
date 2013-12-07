; Each of the following two procedures converts a bi-
; nary tree to a list.
;
(define (tree->list-1 tree)
  (if (null? tree)
    '()
    (append (tree->list-1 (left-branch tree))
            (cons (entry tree)
                  (tree->list-1
                    (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
      result-list
      (copy-to-list (left-branch tree)
                    (cons (entry tree)
                          (copy-to-list
                            (right-branch tree)
                            result-list)))))
  (copy-to-list tree '()))

; a. Do the two procedures produce the same result for every tree? If
; not, how do the results differ? What lists do the two procedures
; produce for the trees in Figure 2.16?
;
; Yes, see below.
;
; b. Do the two procedures have the same order of growth in the
; number of steps required to convert a balanced tree with n ele-
; ments to a list? If not, which one grows more slowly?
;
; tree->list-2  calls cons at every step , in an in-order traversal, so lets
; assume O(n).
; From BillTheLizard: In the case of tree->list-1, the first list argument is
; the left branch of the tree, which is about half of a node's elements for a
; balanced tree. This means that for each recursive call, approximately half of
; the number of nodes will be in the first list argument as in the previous call.
; Since the number of elements is cut in half on each of the n calls to append,
; the tree->list-1 procedure has a complexity of O(nlogn) for a balanced tree.
;
; tree->list-1 is slower.

(define (entry tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (entry set)) true)
        ((< x (entry set))
         (element-of-set? x (left-branch set)))
        ((> x (entry set))
         (element-of-set? x (right-branch set)))))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((< x (entry set))
         (make-tree (entry set)
                    (adjoin-set x (left-branch set))
                    (right-branch set)))
        ((> x (entry set))
         (make-tree (entry set) (left-branch set)
                    (adjoin-set x (right-branch set))))))

(define tree1 '(7 (3 (1 () ()) (5 () ())) (9 () (11 () ())))')
(define tree2 '(3 (1 () ()) (7 (5 () ()) (9 () (11 () ()))))')
(define tree3 '(5 (3 (1 () ()) ()) (9 (7 () ()) (11 () ())))')

; > (tree->list-1 tree1)
; '(1 3 5 7 9 11)
; > (tree->list-2 tree1)
; '(1 3 5 7 9 11)
; > (tree->list-1 tree2)
; '(1 3 5 7 9 11)
; > (tree->list-2 tree2)
; '(1 3 5 7 9 11)
; > (tree->list-1 tree3)
; '(1 3 5 7 9 11)
; > (tree->list-2 tree3)
; '(1 3 5 7 9 11)
