; We specified that a set would be represented as a
; list with no duplicates. Now suppose we allow duplicates. For in-
; stance, the set { 1 , 2 , 3 } could be represented as the list (2 3 2 1 3
; 2 2) . Design procedures element-of-set? , adjoin-set , union-
; set , and intersection-set that operate on this representation.
; How does the efficiency of each compare with the corresponding
; procedure for the non-duplicate representation? Are there appli-
; cations for which you would use this representation in preference
; to the non-duplicate one?

; element-of-set?, intersection-set would work the same
(define (adjoin-set x set) (cons x set))
(define (union-set set1 set2) (append set1 set2))

; Union set and adjoin-set become O(n) and O(1)
