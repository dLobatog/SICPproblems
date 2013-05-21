; a. The sum procedure is only the simplest of a vast number of
; similar abstractions that can be captured as higher-order
; procedures. Write an analogous procedure called product
; that returns the product of the values of a function at points
; over a given range. Show how to define factorial in terms of
; product. Also use product to compute approximations to π
; using the formula
;
; π   2 · 4 · 4 · 6 · 6 · 8...
; - = ----------------------
; 4   3 · 3 · 5 · 5 · 7 · 7...

(define (product f start next end)
  (define (sequence start result)
    (if (> start end)
      result
      (sequence (next start) (* (f start) result))))
  (sequence start 1))

(define (identity n) n)
(define (increment n) (+ n 1))
(define (factorial n)
  (product identity 1 increment n))

(factorial 5) ;=> Value: 120

(define (wallis-pi n)
  (define (term x)
    (/ (* 4.0 (square x))
       (- (* 4.0 (square x)) 1)))
  (* 2.0 (product term 1 increment n)))

(wallis-pi 10000) ;=> Value: 3.1415141186819566

; b. If your product procedure generates a recursive process, write
; one that generates an iterative process. If it generates an itera-
; tive process, write one that generates a recursive process.

(define (product f a next b)
  (if (> a b)
    1
    (* (f a)
       (product f (next a) next b))))

