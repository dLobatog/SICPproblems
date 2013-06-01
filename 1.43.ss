; If f is a numerical function and n is a positive in-
; teger, then we can form the n th repeated application of f, which
; is defined to be the function whose value at x is f ( f (. . . ( f (x )) . . .)).
; For example, if f is the function x → x + 1, then the n th repeated
; application of f is the function x → x + n . If f is the operation
; of squaring a number, then the n th repeated application of f is
; the function that raises its argument to the 2n -th power. Write a
; procedure that takes as inputs a procedure that computes f and
; a positive integer n and returns the procedure that computes the
; 66 The major implementation cost of first-class procedures is that allowing proce-
; dures to be returned as values requires reserving storage for a procedure’s free vari-
; ables even while the procedure is not executing. In the Scheme implementation we
; will study in Section 4.1, these variables are stored in the procedure’s environment.113
; n th repeated application of f . Your procedure should be able to be
; used as follows:
; ((repeated square 2) 5)
; 625
; Hint: You may find it convenient to use compose from Exercise 1.42.

(define (compose f g)
 (lambda (x) (f (g x))))

(define (repeated f times)
 (if (= times 1)
  f
  (compose f (repeated f (- times 1)))))

