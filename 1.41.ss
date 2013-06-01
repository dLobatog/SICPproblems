; Define a procedure double that takes a procedure
; of one argument as argument and returns a procedure that applies
; the original procedure twice. For example, if inc is a procedure
; that adds 1 to its argument, then (double inc) should be a proce-
; dure that adds 2. What value is returned by
; (((double (double double)) inc) 5)

(define (double proc)
 (lambda (x) (proc (proc x)))

; (((double (double double)) inc) 5) returns 21.
; That's because the original double (x2) is doubled (x8), then the innermost double,
; makes it (x16), so inc x16 is +16, 5+16 => 21
