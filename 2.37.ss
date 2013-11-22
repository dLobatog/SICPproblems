; Suppose we represent vectors v = (vi) as sequences of numbers, and matrices
; m = (m(i,j)) as sequences of vectors (the rows of the matrix).
;
; For example, the matrix
; ((1 2 3 4) (4 5 6 6) (6 7 8 9))
; has a set of sequence operations to concisely express the basic matrix and
; vector operations.
;

(define matrix (list (list 1 2 3 4) (list 5 6 7 8) (list 9 10 11 12)))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    '()
    (cons (accumulate op init (map car seqs))
          (accumulate-n op init (map cdr seqs)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (dot-product v w)
    (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
 (map (lambda (row) (dot-product row v)) m))

; (matrix-*-vector matrix (list 2 2 2 2)

(define (transpose mat)
 (accumulate-n cons '() mat))

; (transpose matrix)

(define (matrix-*-matrix m n)
 (let ((cols (transpose n)))
  (map (lambda (row) (matrix-*-vector cols row)) m)))

;When multiplying two matrices m and n, the resulting matrix will have the same number of rows as m
;and the same number of columns as n. Each element of the result matrix can be found by taking the
;dot product of each row of m and each column of n
;
;> (define a (list (list 14 9 3) (list 2 11 15) (list 0 12 17) (list 5 2 3)))
;> (define b (list (list 12 25) (list 9 10) (list 8 5)))
;> (matrix-*-matrix a b) (4x3) * (3x2) = (4x2)
;((273 455) (243 235) (244 205) (102 160))
