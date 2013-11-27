; Right-split and up-split can be expressed as in-
; stances of a general splitting operation. Define a procedure split
; with the property that evaluating
; produces procedures right-split and up-split with the same
; behaviors as the ones already defined

(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(define (split dir1 dir2)
 (lambda (painter n)
  (if (= n 0)
        painter
            (let ((smaller ((split dir1 dir2) painter (- n 1))))
                   (dir1 painter (dir2 smaller smaller))))))

(define right-split (split beside below))
(define up-split (split below beside))

(paint (up-split einstein 3))
(paint (right-split einstein 3))

