; Louis Reasoner has noticed that
; apply-generic may try to coerce the arguments to
; each other’s type even if they already have the same
; type. Therefore, he reasons, we need to put pro-
; cedures in the coercion table to coerce arguments
; of each type to their own type. For example, in
; addition to the scheme-number->complex coercion
; shown above, he would do
(define (scheme-number->scheme-number n) n)
(define (complex->complex z) z)
(put-coercion 'scheme-number 'scheme-number
              scheme-number->scheme-number)
(put-coercion 'complex 'complex
              complex->complex)
; a. With Louis’s coercion procedures installed,
; what happens if apply-generic is called with
; two arguments of type scheme-number or two
; arguments of type complex for an operation that
; is not found in the table for those types? For
; example, assume that we’ve defined a generic
; exponentiation operation:
(define (exp x y)
  (apply-generic 'exp x y))
; and have put a procedure for exponentiation in
; the Scheme-number package but not in any other
; package:
; ;; following added to Scheme-number package
(put 'exp
     '(scheme-number scheme-number)
     (lambda (x y)
       (tag (expt x y))))
; ; using primitive expt
; What happens if we call exp with two complex
; numbers as arguments?

; It will fail since the complex arguments are not going to be coerced into
; scheme-number. It will try to coerce them since the operation exp is not available
; in the complex package, and repeat over and over.

; b. Is Louis correct that something had to be done
; about coercion with arguments of the same type,
; or does apply-generic work correctly as is?
;
; It works as is, provided that a function to coerce if needed exists.

; c. Modify apply-generic so that it doesn’t try coer-
; cion if the two arguments have the same type.

(define (apply-generic op . args)

  (define (signal-error type-tags)
    (error "No method for these types - APPLY-GENERIC"
           (list op type-tags)))

  (define (coerce-types tags args)
    (let ((type1 (car tags))
          (type2 (cadr tags))
          (a1 (car args))
          (a2 (cadr args)))
      (if (eq? type1 type2)
        (signal-error tags)
        (let ((t1->t2 (get-coercion type1 type2))
              (t2->t1 (get-coercion type2 type1)))
          (cond (t1->t2 (apply-generic op (t1->t2 a1) a2))
                (t2->t1 (apply-generic op a1 (t2->t1 a2)))
                (else (signal-error tags)))))))

  (let* ((type-tags (map type-tag args))
         (proc (get op type-tags)))
    (cond  (proc (apply proc (map contents args)))
           ((= (length args) 2) (coerce-types type-tags args))
           (else (signal-error type-tags)))))
