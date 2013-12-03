; Two lists are said to be equal? if they contain equal elements arranged in
; the same order. For example:
(equal? '(this is a list) '(this is a list)) ; #t
; but
(equal? '(this is a list) '(this (is a) list)) ; #f
;
; To be more precise, we can define equal? recursively in
; terms of the basic eq? equality of symbols by saying that a and b
; are equal? if they are both symbols and the symbols are eq? , or
; if they are both lists such that (car a) is equal? to (car b) and
; (cdr a) is equal? to (cdr b) . Using this idea, implement equal?
; as a procedure.


; equal? is already a procedure in scheme, so it'll be equal2?

(define (equal2? a b)
  (if (and (pair? a) (pair? b))
    (and (equal2? (car a) (car b)) (equal2? (cdr a) (cdr b)))
    (eq? a b)))
