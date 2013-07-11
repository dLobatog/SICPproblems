; The procedures +, *, and list take arbitrary num-
; bers of arguments. One way to define such procedures is to use
; define with dotted-tail notation. In a procedure definition, a pa-
; rameter list that has a dot before the last parameter name indicates
; that, when the procedure is called, the initial parameters (if any)
; will have as values the initial arguments, as usual, but the final pa-
; rameter’s value will be a list of any remaining arguments. For in-
; stance, given the definition
(define (f x y . z) 〈body〉)
; the procedure f can be called with two or more arguments. If we
; evaluate
; (f 1 2 3 4 5 6)
; then in the body of f, x will be 1, y will be 2, and z will be the list
; (3 4 5 6). Given the definition
;
(define (g . w) 〈body〉)
; the procedure g can be called with zero or more arguments. If we
; evaluate
(g 1 2 3 4 5 6)
; then in the body of g, w will be the list (1 2 3 4 5 6).11
; Use this notation to write a procedure same-parity that takes one
; or more integers and returns a list of all the arguments that have
; the same even-odd parity as the first argument. For example,
(same-parity 1 2 3 4 5 6 7)
(1 3 5 7)
(same-parity 2 3 4 5 6 7)
(2 4 6)
; Solution:

(define (same-parity first . rest)
  (define (rest-are-even expectation rest answer)
    (cond ((= (length rest) 0)
           answer)
          ((eq? expectation (even? (car rest)))
            (rest-are-even expectation (cdr rest) (append answer (list (car rest)))))
          (else
           (rest-are-even expectation (cdr rest) answer))))
  (if (even? first)
    (rest-are-even true rest (list first))
    (rest-are-even false rest (list first))))
