;Fill in the missing expressions to complete the fol-
;lowing definitions of some basic list-manipulation operations as
;accumulations:

(define (map p sequence)
  (accumulate (lambda (x y) 〈??〉) nil sequence))
(define (append seq1 seq2)
  (accumulate cons seq2 seq1))
(define (length sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence))

; ----------------

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))
