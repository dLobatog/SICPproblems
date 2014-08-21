; Define a generic equality predicate equ? that tests the equality of two
; numbers, and install it in the generic arithmetic package.
; This operation should work for ordinary numbers, rational numbers,
; and complex numbers

(define (equ? a b)
 (apply-generic 'equ x y))

; install-scheme-number-package
(put 'equ? '(scheme-number scheme-number) =)

; in install-rational-package
(put 'equ? '(rational rational) equ-rat)
(define (equ-rat x y)
  (and (= (numer x) (numer y))
       (= (denom x) (denom y))))

; in install-complex-package
(put 'equ? '(complex complex) equ-complex)
(define (equ-complex x y)
  (and (= (real-part x) (real-part y))
       (= (imag-part x) (imag-part y))))


