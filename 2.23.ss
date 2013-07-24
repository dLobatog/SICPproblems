; The procedure for-each is similar to map. It takes
; as arguments a procedure and a list of elements. However, rather
; than forming a list of the results, for-each just applies the proce-
; dure to each of the elements in turn, from left to right. The values
; returned by applying the procedure to the elements are not used
; at all—for-each is used with procedures that perform an action,
;    such as printing. For example,
(for-each (lambda (x)
            (newline)
            (display x))
          (list 57 321 88))
; 57
; 321
; 88
;
; The value returned by the call to for-each (not illustrated above)
; can be something arbitrary, such as true. Give an implementation
; of for-each.

(define (my-for-each f coll)
  (define (print-and-recurse f coll)
    (f (car coll))
    (my-for-each f (cdr coll)))
  (if (null? coll)
    true
    (print-and-recurse f coll)))
