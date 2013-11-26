; Write a procedure to find all ordered triples of dis-
; tinct positive integers i , j , and k less than or equal to a given inte-
; ger n that sum to a given integer s .

(define (unique-triplets n)
  (flatmap (lambda (i)
      (flatmap (lambda (j)
             (map (lambda (k) (list i j k))
                  (enumerate-interval 1 (- j 1))))
      (enumerate-interval 1 (- i 1))))
  (enumerate-interval 1 n)))

(define (sum-upto? n s)
  (= (reduce + 0 n) s))

(define (find-triplets n s)
  (filter (lambda (triplet) (sum-upto? triplet s)) (unique-triplets n)))
