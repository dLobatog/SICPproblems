; Make changes to the square limit of wave shown in
; Figure 2.9 by working at each of the levels described above. In par-
; ticular:
;
; a. Add some segments to the primitive wave painter of Exercise
;    2.49 (to add a smile, for example).

(load "2.45.ss")

(define (wave frame)
  ((segments->painter (list (make-segment (make-vect 0 0.6) (make-vect 0.2 0.4))
                            (make-segment (make-vect 0.2 0.4) (make-vect 0.3 0.55))
                            (make-segment (make-vect 0.3 0.55) (make-vect 0.35 0.45))
                            (make-segment (make-vect 0.35 0.45) (make-vect 0.25 0))
                            (make-segment (make-vect 0.4 0) (make-vect 0.5 0.3))
                            (make-segment (make-vect 0.5 0.3) (make-vect 0.6 0))
                            (make-segment (make-vect 0.75 0) (make-vect 0.6 0.45))
                            (make-segment (make-vect 0.6 0.45) (make-vect 0.99 0.15))
                            (make-segment (make-vect 0 0.8) (make-vect 0.2 0.55))
                            (make-segment (make-vect 0.2 0.55) (make-vect 0.3 0.6))
                            (make-segment (make-vect 0.3 0.6) (make-vect 0.4 0.6))
                            (make-segment (make-vect 0.4 0.6) (make-vect 0.35 0.8))
                            (make-segment (make-vect 0.35 0.8) (make-vect 0.4 0.99))
                            (make-segment (make-vect 0.6 0.99) (make-vect 0.65 0.8))
                            (make-segment (make-vect 0.65 0.8) (make-vect 0.6 0.6))
                            (make-segment (make-vect 0.6 0.6) (make-vect 0.8 0.6))
                            (make-segment (make-vect 0.8 0.6) (make-vect 0.99 0.35))
                            (make-segment (make-vect 0.395 0.916) (make-vect 0.410 0.916)) ; eye
                            (make-segment (make-vect 0.376 0.746) (make-vect 0.460 0.790)) ; smile
                            ))
   frame))

; b. Change the pattern constructed by corner-split (for example,
;    by using only one copy of the up-split and right-split im-
;    ages instead of two).

(define (corner-split painter n)
  (if (= n 0)
    painter
    (let ((up (up-split painter (- n 1)))
          (right (right-split painter (- n 1)))
          (corner (corner-split painter (- n 1))))
      (beside (below painter up)
              (below right corner)))))

(paint (corner-split wave 2))

; c. Modify the version of square-limit that uses square-of-four
;    so as to assemble the corners in a different pattern. (For exam-
;    ple, you might make the big Mr. Rogers look outward from each
;    corner of the square.)

(define (square-limit painter n)
  (let ((quarter (rotate180 (corner-split painter n))))
      (let ((half (beside (flip-horiz quarter) quarter)))
            (below (flip-vert half) half))))

(paint (square-limit wave 2))
