; Show that sum and product (Exercise 1.31) are both special cases
; of a still more general notion called accumulate that combines a
; collection of terms, using some general accumulation function:
; (accumulate combiner null-value term a next b)
; Accumulate takes as arguments the same term and range spec-
; ifications as sum and product, together with a combiner proce-
; dure (of two arguments) that specifies how the current term is
; to be combined with the accumulation of the preceding terms
; and a null-value that specifies what base value to use when
; the terms run out. Write accumulate and show how sum and
; product can both be defined as simple calls to accumulate

(define (accumulate combiner null-value term a next b) ; Actually null-value
  (define (sequence a result)                          ; is just the identity
    (if (> a b)                                        ; of the operation
      result
      (sequence (next a) (combiner (term a) result))))
  (sequence a null-value))

; -TESTS-

(define (sum term a next b)
 (accumulate + 0 term a next b))

(define (cube x) (* x x x))
(define (inc n) (+ n 1))
(define (sum-cubes a b)
 (sum cube a inc b))
(sum-cubes 1 10)  ;=> Value: 3025

(define (product term a next b)
 (accumulate * 1 term a next b))

(define (identity n) n)
(define (increment n) (+ n 1))
(define (factorial n)
  (product identity 1 increment n))

(factorial 5) ;=> Value: 120
