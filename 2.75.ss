; Implement the constructor make-from-mag-ang in message-passing style.
; This procedure should be analogous to the make-from-real-imag procedure given above.

(define (make-from-mag-ang r a)
  (define (dispatch op)
    (cond ((eq? op 'polar) (cons r a))
          ((eq? op 'rectangular) (cons (* r (cos a)) (* r (sin a))))
          ((eq? op 'magnitude r))
          ((eq? op 'angle a))
          (else
            (error "Unknown op: -- MAKE-FROM-MAG-ANG" op))))
  dispatch)
