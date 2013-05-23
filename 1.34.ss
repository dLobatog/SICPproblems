; Suppose we define the procedure
; (define (f g) (g 2))
; Then we have
; (f square)
; 4
; (f (lambda (z) (* z (+ z 1))))
; 6
; What happens if we (perversely) ask the interpreter to evaluate the
; combination (f f)? Explain.

It fails because 2 is not a procedure that can be evaluated on 2, it's simply
a constant.
