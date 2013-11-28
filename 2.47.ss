; Here are two possible constructors for frames:



; For each constructor supply the appropriate selectors to produce
; an implementation for frames.

;Constructor 1:

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame) (car frame))
(define (edge1-frame  frame) (list-ref frame 1))
(define (edge2-frame  frame) (list-ref frame 2))

;Constructor 2:

(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame frame) (car frame))
(define (edge1-frame  frame) (cadr frame))
(define (edge2-frame  frame) (cddr frame))

