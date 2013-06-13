; Consider the problem of representing line segments
; in a plane. Each segment is represented as a pair of points:
; a starting point and an ending point. Define a constructor
; make-segment and selectors start-segment and end-segment
; that define the representation of segments in terms of points.
; Furthermore, a point can be represented as a pair of numbers:
; the x coordinate and the y coordinate. Accordingly, specify a
; constructor make-point and selectors x-point and y-point
; that define this representation. Finally, using your selectors and
; constructors, define a procedure midpoint-segment that takes
; a line segment as argument and returns its midpoint (the point
; whose coordinates are the average of the coordinates of the
; endpoints).
; To try your procedures, you’ll need a way to print points

(define make-point cons)
(define x-point car)
(define y-point cdr)
(define make-line cons)
(define start-point car)
(define end-point cdr)
; In short, the purpose of this exercise is to show that sometimes the
; concept and the abstraction is good enough to write clean programs

(define (midpoint-segment line)
  (make-point (/ (+ (x-point (start-point line)) (x-point (end-point line))) 2)
              (/ (+ (y-point (start-point line)) (y-point (end-point line))) 2)))
; select coordinates start-point x and y, average with x and y of (end-point line))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))
