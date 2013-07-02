; helper functions:
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))
(define (div-interval x y)
  (mul-interval
    x
    (make-interval (/ 1.0 (upper-bound y))
                   (/ 1.0 (lower-bound y)))))
(define (make-interval a b) (cons a b))
(define upper-bound car)
(define lower-bound cdr)
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (make-interval (- c (* c p)) (+ c (* c p))))

(define (percent i)
  (- (/ (upper-bound i) (center i)) 1))

; After considerable work, Alyssa P. Hacker delivers her finished sys-
; tem. Several years later, after she has forgotten all about it, she gets
; a frenzied call from an irate user, Lem E. Tweakit. It seems that Lem
; has noticed that the formula for parallel resistors can be written in
; two algebraically equivalent ways:
; R1 * R2
; -------
; R1 + R2
;
; and
; 1
; -------------
; 1/R1 + 1/R2
;
; He has written the following two programs, each of which com-
; putes the parallel-resistors formula differently:
(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
      one (add-interval (div-interval one r1)
                        (div-interval one r2)))))

; Lem complains that Alyssa’s program gives different answers for
; the two ways of computing. This is a serious complaint.

; Demonstrate that Lem is right. Investigate the be-
; havior of the system on a variety of arithmetic expressions. Make
; some intervals A and B , and use them in computing the expres-
; sions A/A and A/B . You will get the most insight by using intervals
; whose width is a small percentage of the center value. Examine the
; results of the computation in center-percent form

(define a (make-center-percent 30 0.01))
(define b (make-center-percent 10 0.01))


;1 ]=> (par1 a b)
;
;Value (7.277970297029704 . 7.728030303030303)
;
;1 ]=> (par2 a b)
;
;;Value (7.425 . 7.575000000000001)


; The main reason why this is happening is because these divisions are
; taking floating point precision to its limit, so if divisions are
; performed more than once, the error is propagated further away.
;
; For instance, operations like (center (div-interval a a)) are just an approximation
; to 1. This should be taken into account when operating with this interval
; library.
