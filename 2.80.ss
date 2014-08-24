; Define a generic equality predicate =zero? that tests the equality of two
; numbers, and install it in the generic arithmetic package.
; This operation should work for ordinary numbers, rational numbers,
; and complex numbers

(define (=zero? a b)
 (apply-generic '=zero x y))

(put '=zero? '(scheme-number scheme-number) zero?)
(put '=zero? '(rational rational) =zero-rat?)
(put '=zero? '(complex complex) =zero-complex?)

(define (=zero-rat? x)
  (= (numer x) 0))

(define (=zero-complex? x)
  (= (real-part x) 0))
