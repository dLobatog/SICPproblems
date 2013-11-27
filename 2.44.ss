; Define the procedure up-split used by corner-
; split . It is similar to right-split , except that it switches the roles
; of below and beside.

; Open with Drracket to see the picture
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(define (up-split painter n)
   (if (= n 0)
        painter
            (let ((smaller (up-split painter (- n 1))))
                   (below painter (beside smaller smaller)))))

(paint (up-split einstein 3))
