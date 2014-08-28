; Show how to generalize apply-generic to handle
; coercion in the general case of multiple arguments. One strategy is
; to attempt to coerce all the arguments to the type of the first argu-
; ment, then to the type of the second argument, and so on. Give an
; example of a situation where this strategy (and likewise the two-
; argument version given above) is not sufficiently general. (Hint:
; Consider the case where there are some suitable mixed-type oper-
; ations present in the table that will not be tried.)

; Solution:
; If we have the following types
; a -> b -> c ; d
; and our args are of type b and d, this strategy won't work because d cannot be
; coerced into b.
; Also if the available coerciones are a -> b and b -> c, and arguments are a and c,
; it'll be impossible to follow this strategy if we only try to coerce from a to c in one
; step.
; A solution for this problem could be to figure out a graph with the available coercions
; and similarly, attempt to coerce all arguments to some other by checking the shortest
; path to it.

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
        (apply proc (map contents args))
        (coerce args type-tags op)))))

          (let ((type1 (car type-tags))
                (type2 (cadr type-tags))
                (a1 (car args))
                (a2 (cadr args)))
            (let ((t1->t2 (get-coercion type1 type2))
                  (t2->t1 (get-coercion type2 type1)))
              (cond (t1->t2
                      (apply-generic op (t1->t2 a1) a2))
                    (t2->t1
                      (apply-generic op a1 (t2->t1 a2)))
                    (else (error "No method for these types"
                                 (list op type-tags)))))))

; Find if all can coerce to the type of any of the arguments
; Coerce to that type if possible.

(define (last items)
  (if (null? (cdr items))
    (car items)
    (last (cdr items))))

(define (can-coerce-to? type args)
  (if (null? args)
    #t
    (and (or (get-coercion (car args) type) (equal? (car args) type))
         (can-coerce-to? type (cdr args)))))

(define (goal-type types)
  (let ((last-type (last types))
        (define (goal-type-internal previous-car types)
          (if (equal? previous-car last-type) ; This avoids reiterating over the list
            (error "No coercion is possible")
            (if (can-coerce-to? (car types) types)
              (car types)
              (goal-type (append (cdr types) (list (car types)))))))
        (goal-type-internal types))))

(define (get-all-coercions types goal)
  (if (null? (cdr types))
    (get-coercion (car types) goal)
    (append (get-all-coercions (cdr types) goal) (list (get-coercion (car types) goal)))))

(define (coerce args types op)
  (if (null? types)
    (error "No method for these types")
    (let ((goal-type (goal-type types))
          (apply-generic op (map (lambda (arg)
                                   (let ((type (type-tag arg)))
                                     (if (equal? type goal-type)
                                       arg
                                       ((get-coercion type goal-type) arg)))))))))
