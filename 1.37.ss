; a. An infinite continued fraction is an expression of the form
; f =    N1
;    ---------
;     D1 + N2
;         -----
;         D2+N3
;            --
;            D3 +..
;
; As an example, one can show that the infinite continued
; fraction expansion with the Ni and the Di all equal to 1
; produces 1/φ, where φ is the golden ratio (described in Section 1.2.2).
;
; One way to approximate an infinite continued fraction is
; to truncate the expansion after a given number of terms. Such
; a truncation—a so-called k-term finite continued fraction—has
; the form
;
; Suppose that n and d are procedures of one argument
; (the term index i) that return the Ni and Di of the terms of the contin-
; ued fraction. Define a procedure cont-frac such that evalu-
; ating (cont-frac n d k) computes the value of the k -term fi-
; nite continued fraction. Check your procedure by approximat-
; ing 1/φ using
; (cont-frac (lambda (i) 1.0)
;  (lambda (i) 1.0)
;  k)
; for successive values of k. How large must you make k in order
; to get an approximation that is accurate to 4 decimal places?

; b. If your cont-frac procedure generates a recursive process,
;   write one that generates an iterative process. If it generates an
;   iterative process, write one that generates a recursive process.c

(define (cont-frac n d k)
  (if (= k 0)
    1
    (/ (n k) (+ (d k) (cont-frac n d (- k 1))))))

(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k)

; 10 makes cont-frac accurate to the 4th decimal, check
;
; (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 10)
;
; ;Value: .6180555555555556

(define (cont-frac n d k)
  (define (cont-frac-iter n d k acc)
    (if (= k 0)
      acc
      (/ (n k) (+ (d k) (cont-frac-iter n d (- k 1) acc)))))
  (cont-frac-iter n d k 0))


