; In case representing pairs as procedures wasn’t mind-
; boggling enough, consider that, in a language that can manipu-
; late procedures, we can get by without numbers (at least insofar as
; nonnegative integers are concerned) by implementing 0 and the
; operation of adding 1 as

(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; This representation is known as Church numerals, after its inven-
; tor, Alonzo Church, the logician who invented the λ-calculus.
; Define one and two directly (not in terms of zero and add-1). (Hint:
; Use substitution to evaluate (add-1 zero)). Give a direct defini-
; tion of the addition procedure + (not in terms of repeated applica-
; tion of add-1).

; -------------------- Solution
; Quick observation - Zero - g(y) = y
; Church numerals represent integers by applying their input procedure
; as many times as the integer is supposed to appear. Therefore,
; zero is the input procedure applying its input procedure zero times,
; one is the input procedure applying its input procedure once and so on.

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

; Adding two numerals is going to be represented as applying the input procedure
; as many times as the first argument (a church numeral) plus applying that
; procedure as many times as the second argument.

(define (add-church m n)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))

; This is easily testable by defining a simple procedure that runs as many times as
; required by the Church numeral
(define (inc x) (+ x 1))

; Simple tests for zero, one and two. We can see how inc runs as many times as
; defined by the Church numeral

((zero inc) 0) ; value = 0
((one inc) 0)  ; value = 1
((two inc) 0)  ; value = 2

; And the real test, adding two numbers works as well
(((add-church one two) inc) 0) ; value = 3

; We can go on and make procedures for all natural numbers using Church numerals,
; they would have the form

(define four (add-church two two))

; And perform math operations on natural numbers in terms of procedures instead of numbers.
