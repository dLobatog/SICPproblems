; We can represent a set as a list of distinct elements,
; and we can represent the set of all subsets of the set as a list of
; lists. For example, if the set is (1 2 3), then the set of all subsets is
; (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3)). Complete the
; following definition of a procedure that generates the set of subsets
; of a set and give a clear explanation of why it works

(define (subsets s)
  (if (null? s)
    (list '())
    (let ((rest (subsets (cdr s))))
      (append rest (map (lambda (x) (cons (car s) x)) rest)))))

; The procedure works as follows:
; First the definition of 'rest' recurses over until it gets to generate an empty list ()
; When the empty list has been generated, the next step is to append each of the elements
; to it.
; At this point a list with all elements (just once) has been created. Now for each of
; these lists, it's necessary to append the rest of the elements to it, and do this
; operation recursively. At the end of the day we will have a set of all subsets (powerset)
; 'Rest' acts as an accumulator.
