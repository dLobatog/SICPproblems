; A two-dimensional vector v running from the
; origin to a point can be represented as a pair consisting of an
; x -coordinate and a y -coordinate. Implement a data abstraction
; for vectors by giving a constructor make-vect and corresponding
; selectors xcor-vect and ycor-vect . In terms of your selectors
; and constructor, implement procedures add-vect , sub-vect , and
; scale-vect that perform the operations vector addition, vector
; subtraction, and multiplying a vector by a scalar:

(define (make-vect x-coordinate y-coordinate)
  (cons x-coordinate y-coordinate))

(define (xcor-vect vect)
  (car vect))
(define (ycor-vect vect)
  (cdr vect))

(define (add-vect vector1 vector2)
  (make-vect (+ (xcor-vect vector1) (xcor-vect vector2))
             (+ (ycor-vect vector1) (ycor-vect vector2))))

(define (sub-vect vector1 vector2)
  (make-vect (- (xcor-vect vector1) (xcor-vect vector2))
             (- (ycor-vect vector1) (ycor-vect vector2))))

(define (scale-vect scalar vect)
  (make-vect (* scalar (xcor-vect vect))
             (* scalar (ycor-vect vect))))

;]=> (scale-vect 3 (make-vect 3 5))
;Value : (9 . 15)
