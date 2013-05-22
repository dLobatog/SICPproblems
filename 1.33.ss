; You can obtain an even more general version of
; accumulate (Exercise 1.32) by introducing the notion of a filter
; on the terms to be combined. That is, combine only those terms
; derived from values in the range that satisfy a specified condition.
; The resulting filtered-accumulate abstraction takes the same
; arguments as accumulate, together with an additional predicate
; of one argument that specifies the filter.
; Write filtered-accumulate as a procedure.
; Show how to express the following  using filtered-accumulate:
;
; a. the sum of the squares of the prime numbers in the interval a to
;    b (assuming that you have a prime? predicate already written)
;
; b. the product of all the positive integers less than n that are
;    relatively prime to n (i.e., all positive integers i < n such that GCD(i, n) = 1).

(define (filtered-accumulate filters combiner null-value term a next b)
  (define (next-filtered n)
    (if (filters (next n))
     (next n)
     (next-filtered (next n))))
  (define (sequence a result)
    (if (> a b)
      result
      (sequence (next-filtered a) (combiner (term a) result))))
  (sequence a null-value))

;-- a
(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (inc n) (+ n 1))

(define (sum-squares-primes a b)
  (filtered-accumulate prime? + 0 square a inc b))

(sum-squares-primes 0 10) ;Value: 88 - 7*7 + 5*5 + 3*3 + 2*2 + 1*1

;-- b

(define (identity n) n)

(define (product-relatively-prime n)
  (define (relatively-prime? test)
    (if (= (gcd n test) 1)
      #t
      #f))
  (filtered-accumulate relatively-prime? * 1 identity 1 inc n))

(product-relatively-prime 10) ;Value: 189 - 3 * 7 * 9
