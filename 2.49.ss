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

(define (outline frame)
  ((segments->painter (list (make-segment (make-vect 0 0) (make-vect 0 0.99))
                            (make-segment (make-vect 0 0) (make-vect 0.99 0))
                            (make-segment (make-vect 0.99 0) (make-vect 0.99 0.99))
                            (make-segment (make-vect 0 0.99) (make-vect 0.99 0.99))))
   frame))

(define (x frame)
  ((segments->painter (list (make-segment (make-vect 0 0) (make-vect 0.99 0.99))
                            (make-segment (make-vect 0 0.99) (make-vect 0.99 0))))
   frame))

(define (diamond frame)
  ((segments->painter (list (make-segment (make-vect 0 0.5) (make-vect 0.5 0))
                            (make-segment (make-vect 0.5 0) (make-vect 0.99 0.5))
                            (make-segment (make-vect 0.99 0.5) (make-vect 0.5 0.99))
                            (make-segment (make-vect 0.5 0.99) (make-vect 0 0.5))))
   frame))

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
                            (make-segment (make-vect 0.8 0.6) (make-vect 0.99 0.35))))
   frame))

(paint outline)
(paint x)
(paint diamond)
(paint wave)
