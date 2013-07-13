; Louis Reasoner tries to rewrite the first square-list
; procedure of Exercise 2.21 so that it evolves an iterative process:
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
            (cons (square (car things))
                  answer))))
  (iter items nil))
; Unfortunately, defining square-list this way produces the an-
; swer list in the reverse order of the one desired. Why?
;
; Louis then tries to fix his bug by interchanging the arguments to
; cons:
;
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
            (cons answer
                  (square (car things))))))
  (iter items nil))
; This doesn’t work either. Explain.
; Solution:
;
; The first example does not output the right thing because the function iter
; is 'consing' the elements in the reverse order.
;
; The fix does not work, it will output the ordered list, but it is creating a
; new list out of every 'answer', therefore yielding ((() . 1) . 4) . 9)..
; append would be a more fit function for this purpose.
