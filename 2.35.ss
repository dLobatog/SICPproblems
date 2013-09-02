; Redefine count-leaves from Section 2.2.2 as an ac-
; cumulation:

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (node)
                         (if (pair? node)
                           (count-leaves node)
                           1))
                       t)))

(count-leaves (list (list 1 2) (list 1 2 3) 1))
; should return 6
