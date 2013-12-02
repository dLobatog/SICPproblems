; Define the below operation for painters. Below takes
; two painters as arguments. The resulting painter, given a frame,
; draws with the first painter in the bottom of the frame and with the
; second painter in the top. Define below in two different ways—first
; by writing a procedure that is analogous to the beside procedure
; given above, and again in terms of beside and suitable rotation
; operations

(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(define (below2 painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-bottom
            ((transform-painter (make-vect 0.0 0.0)
                                (make-vect 1.0 0.0)
                                split-point)
             painter1))
          (paint-top
            ((transform-painter split-point
                                (make-vect 1.0 0.5)
                                (make-vect 0.0 1.0))
             painter2)))
      (lambda (frame)
        (paint-bottom frame)
        (paint-top frame)))))

(paint (below2 einstein einstein))
