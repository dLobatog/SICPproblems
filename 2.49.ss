; Use segments->painter to define the following
; primitive painters:
; a. The painter that draws the outline of the designated frame.
; b. The painter that draws an “X” by connecting opposite corners
; of the frame.
; c. The painter that draws a diamond shape by connecting the mid-
; points of the sides of the frame.
; d. The wave painter.

(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
      (lambda (segment)
        (draw-line
          ((frame-coord-map frame)
           (start-segment segment))
          ((frame-coord-map frame)
           (end-segment segment))))
      segment-list)))

(define (outline-frame))
