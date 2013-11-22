; Complete the following definitions of reverse (Exercise 2.18)
; in terms of fold-right and fold-left from Exercise 2.38:

(define (reverse-fold sequence)
 (fold-right (lambda (x y) (append y (list x))) () sequence))
; x is (car sequence), y is ()
; (reverse-fold (list 1 2 3 4 5)) -> (5 4 3 2 1)

(define (reverse-fold sequence)
 (fold-left (lambda (x y) (append (list y) x)) () sequence))
; x is (), y is (car sequence)
; (reverse-fold (list 1 2 3 4 5)) -> (5 4 3 2 1)
