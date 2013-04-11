;Exercise 1.19: There is a clever algorithm for computing the
;Fibonacci numbers in a logarithmic number of steps. Recall the
;transformation of the state variables a and b in the fib-iter
;process of Section 1.2.2: a ← a + b and b ← a . Call this
;transformation T , and observe that applying T over and over
;again n times, starting with 1 and 0, produces the pair Fib(n + 1)
;and Fib(n ). In other words, the Fibonacci numbers are produced
;by applying T n , the n th power of the transformation T , starting
;with the pair (1, 0). Now consider T to be the special case of
;p = 0 and q = 1 in a family of transformations T pq , where T pq
;transforms the pair (a, b ) according to a ← bq + aq + ap and
;b ← bp + aq . Show that if we apply such a transformation T pq
;twice, the effect is the same as using a single transformation T p q
;of the same form, and compute p and q in terms of p and q .
;This gives us an explicit way to square these transformations,
;and thus we can compute T n using successive squaring, as in
;the fast-expt procedure. Put this all together to complete the
;following procedure, which runs in a logarithmic number of
;steps
;
;Solution: get the transformation, a -> bq + aq + ap and b -> bp + aq. 
;Do it twice and you get
;a2 = (bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p
;b2 = (bp + aq)p + (bq + aq + ap)q
;
;Now a2 must fit the form -> a2 = bq' + aq' + ap', and b2 must fit the form,
;-> b2 = bp' + aq'
;
;After simplifying the system we end up with
;
;a2 = b(2pq + qq) + a(2pq + qq) + a(pp + qq)
;b2 = b(pp + qq) + a(qq + 2pq)

(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))
                   (+ (* 2 (* p q)) (* q q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
