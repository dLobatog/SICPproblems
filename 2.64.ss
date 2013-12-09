; The following procedure list->tree converts
; an ordered list to a balanced binary tree. The helper procedure
; partial-tree takes as arguments an integer n and list of at least
; n elements and constructs a balanced tree containing the first n
; elements of the list.  result returned by partial-tree is a pair
; (formed with cons ) whose car is the constructed tree and whose
; cdr is the list of elements not included in the tree.

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
    (cons '() elts)
    (let ((left-size (quotient (- n 1) 2)))
      (let ((left-result
              (partial-tree elts left-size)))
        (let ((left-tree (car left-result))
              (non-left-elts (cdr left-result))
              (right-size (- n (+ left-size 1))))
          (let ((this-entry (car non-left-elts))
                (right-result
                  (partial-tree
                    (cdr non-left-elts)
                    right-size)))
            (let ((right-tree (car right-result))
                  (remaining-elts
                    (cdr right-result)))
              (cons (make-tree this-entry
                               left-tree
                               right-tree)
                    remaining-elts))))))))

; a. Write a short paragraph explaining as clearly as you can how
; partial-tree works. Draw the tree produced by list->tree
; for the list (1 3 5 7 9 11) .
;
; Partial-tree returns a list containing a tree.
; It's a recursive procedure that finds the left subtree of the current node
; dividing the length of the list by two until there is only one element in the list.
; This will be the leftmost leaf of the tree. Going upwards in the stack, its parent will
; be the element at the 'cadr' position of the previous iteration. For instance, for a
; list of 6 elements, the 1st element will be the leftmost child of the 3rd element.
;
; In order to find the right subtree, this procedure takes all the elements between
; a node and the next node in the halving sequence we defined before (6, 3, 1) in
; our example, and it recursively calls partial-tree upon that sequence
;
;                 5
;            1         9
;               3    7   11
;
; b. What is the order of growth in the number of steps required by
; list->tree to convert a list of n elements?
;
; Only one extra step will be needed for every element added to the list,
; therefore, O(n).
; This procedure will require a large stack to store all iterations needed to make
; a tree out of a big list.
