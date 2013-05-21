;The sum procedure above generates a linear recur-
;sion. The procedure can be rewritten so that the sum is performed
;iteratively. Show how to do this by filling in the missing expressions
;in the following definition:
;(define (sum term a next b)
; (define (iter a result)
;  (if 〈??〉
;      〈??〉
;      (iter 〈??〉 〈??〉)))
; (iter 〈??〉 〈??〉))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ (term a) result))))
  (iter a 0))

; As a simple test to our procedure, we can define 'next' and 'term' and
; pass it over to sum.

(define (cube x) (* x x x))
(define (inc n) (+ n 1))
(define (sum-cubes a b)
 (sum cube a inc b))
(sum-cubes 1 10)  ;=> Value: 3025
