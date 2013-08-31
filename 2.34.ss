; Evaluating a polynomial in x at a given value of x can
; be formulated as an accumulation. We evaluate the polynomial
;      an * x^n + a(n−1) * x^n−1 + . . . + a1 * x + a0
; using a well-known algorithm called Horner’s rule, which struc-
; tures the computation as
;      (. . . (an * x + a(n−1))x + . . . + a1 )x + a0 .
; In other words, we start with a n , multiply by x , add a n−1 , multiply
; by x , and so on, until we reach a 0 .16
; Fill in the following template to produce a procedure that evaluates
; a polynomial using Horner’s rule. Assume that the coefficients of
; the polynomial are arranged in a sequence, from a 0 through a n .
; (define (horner-eval x coefficient-sequence)
;  (accumulate (lambda (this-coeff higher-terms) 〈??〉)
;   0
;   coefficient-sequence))
;For example, to compute 1 + 3x + 5x 3 + x 5 at x = 2 you would
;evaluate
;(horner-eval 2 (list 1 3 0 5 0 1))

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                (+  (* x higher-terms) this-coeff))
              0
              coefficient-sequence))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(horner-eval 2 (list 1 3 0 5 0 1))
