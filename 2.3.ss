; Implement a representation for rectangles in a plane.
; (Hint: You may want to make use of Exercise 2.2.) In terms of
; your constructors and selectors, create procedures that compute
; the perimeter and the area of a given rectangle. Now implement
; a different representation for rectangles. Can you design your sys-
; tem with suitable abstraction barriers, so that the same perimeter
; and area procedures will work using either representation?

(define make-point cons)
(define x-point car)
(define y-point cdr)
(define make-line cons)
(define start-point car)
(define end-point cdr)

; rectangle constructor
; join two opposite corners
(define (make-rect a b) (cons a b))

; rectangle selectors
(define (rect-width r)
   (abs (- (x-point (car r)) (x-point (cdr r)))))

(define (rect-height r)
   (abs (- (y-point (car r)) (y-point (cdr r)))))

(define (rect-perimeter r)
   (* 2 (+ (rect-width r) (rect-height r))))

(define (rect-area r)
   (* (rect-width r) (rect-height r)))

; > (define a (make-point 0 0))
; > (define b (make-point 2 10))
; > (define r (make-rect a b))
; > (display (rect-perimeter r))
; 24
; > (display (rect-area r))
; 20
