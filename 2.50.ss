; Define the transformation flip-horiz , which flips
; painters horizontally, and transformations that rotate painters
; counterclockwise by 180 degrees and 270 degrees.

(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(define (flip-horiz painter)
  (transform-painters painter
                      (make-vect 1.0 0.0)
                      (make-vect 0.0 0.0)
                      (make-vect 1.0 1.0)))

(define (rotate-counterclockwise-180 painter)
  (transform-painters painter
                      (make-vect 1.0 1.0)
                      (make-vect 0.0 1.0)
                      (make-vect 1.0 0.0)))

(define (rotate-counterclockwise-270 painter)
  (transform-painters painter
                      (make-vect 0.0 1.0)
                      (make-vect 0.0 0.0)
                      (make-vect 1.0 1.0)))

