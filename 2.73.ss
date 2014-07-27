; Section 2.3.2 described a program that performs symbolic differentiation:

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum (make-product
                     (multiplier exp)
                     (deriv (multiplicand exp) var))
                   (make-product
                     (deriv (multiplier exp) var)
                     (multiplicand exp))))
        (else (error "unknown expression type:
                     DERIV" exp))))

; We can regard this program as performing a dispatch on the type of
; the expression to be differentiated. In this situation the “type tag”
; of the datum is the algebraic operator symbol (such as + ) and the
; operation being performed is deriv . We can transform this pro-
; gram into data-directed style by rewriting the basic derivative pro-
; cedure as
;
(define get 2d-get)
(define put 2d-put!)
(define (attach-tag type-tag x y)
     (list type-tag x y))

(define (type-tag datumn)
     (car datumn))

(define (contents datumn)
     (cdr datumn))

(define (=number? exp num)
  (and (number? exp) (= exp num)))
(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
   (and (variable? v1) (variable? v2) (eq? v1 v2)))
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp))
               (operands exp) var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

; a. Explain what was done above. Why can't we assimilate the pred-
; icates number? and variable? into the data-directed dispatch?
;
; Number and variable are not the tags that define what method should
; be dispatched, operators are (sum and product).
;
; b. Write the procedures for derivatives of sums and products, and
; the auxiliary code required to install them in the table used by
; the program above.
;
(define (install-sum-package)
  (define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2)) (+ a1 a2))
          (else (list a1 '+ a2))))

  (define (sum? x)
    (and (pair? x) (eq? (cadr x) '+)))

  (define (addend s) (car s))
  (define (augend s) (cadr s))
  ;; derivative of sum:
  ;;   deriv(first) + deriv(second)
  (define (deriv-sum opds var)
    (make-sum (deriv (addend opds) var)
              (deriv (augend opds) var)))
  ;; interface
  (put 'deriv '+ deriv-sum)
  (put 'addend '+ addend)
  (put 'augend '+ augend)
  (put 'make-sum '+ make-sum)
  'done)

(define (make-sum x y)
     ((get 'make-sum '+) x y))

(define (addend sum)
     ((get 'addend '+) (contents sum)))

(define (augend sum)
     ((get 'augend '+) (contents sum)))

(define (install-product-package)
  (define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
          ((=number? m1 1) m2)
          ((=number? m2 1) m1)
          ((and (number? m1) (number? m2)) (* m1 m2))
          (else (list m1 '* m2))))

  (define (product? x)
    (and (pair? x) (eq? (cadr x) '*)))

  (define (multiplier p) (car p))
  (define (multiplicand p) (cadr p))
  ;; derivative of product:
  ;;   first * deriv(second) + second * deriv(first)
  (define (deriv-product opds var)
    (make-sum
      (make-product (multiplier opds)
                    (deriv (multiplicand opds) var))
      (make-product (deriv (multiplier opds) var)
                    (multiplicand opds))))
  ;; interface
  (put 'deriv '* deriv-product)
  (put 'multiplier '* multiplier)
  (put 'multiplicand '* multiplicand)
  (put 'make-product '* make-product)
  'done)

(define (make-product x y)
  ((get 'make-product '*) x y))

(define (multiplier product)
  ((get 'multiplier '*) (contents product)))

(define (multiplicand product)
  ((get 'multiplicand '*) (contents product)))

; c. Choose any additional differentiation rule that you like, such as
; the one for exponents (Exercise 2.56), and install it in this data-
; directed system.
;
(define (install-exponentiation-package)
  (define (make-exponentiation base exp)
    (cond ((=number? exp 0) 1)
          ((=number? exp 1) base)
          (else (list '** base exp))))
  (define (base opds) (car opds))
  (define (exponent opds) (cadr opds))
  ;; exponentiation derivative:
  ;;     exponent * (base ^ exponent - 1)
  (define (deriv-exponentation opds var)
    (make-product
      (exponent opds)
      (make-product
        (make-exponentiation (base opds)
                             (make-sum (exponent opds) (- 1)))
        (deriv (base opds) var))))
  ;; interface
  (put 'deriv '** deriv-exponentation)
  (put 'base '** base)
  (put 'exponent '** exponent)
  (put 'make-exponentiation '** make-exponentiation)
  'done)

(define (make-exponentiation base exp)
     ((get 'make-exponentiation '**) base exp))

(define (base opds)
   ((get 'base '**) (contents opds)))

(define (exponent opds)
   ((get 'exponent '**) (contents opds)))


(deriv '(** (+ (** x 2) 1) 2) 'x)

; EXAMPLES
; (deriv '(** (+ (** x 2) 1) 2) 'x)
;
; value: (2 * ((+ (** x 2) 1) * (2 * x)))
;
; (deriv '(** (+ (* 3 x) y) 1) 'x)
;
; value: 3

; d. In this simple algebraic manipulator the type of an expression
; is the algebraic operator that binds it together. Suppose, how-
; ever, we indexed the procedures in the opposite way, so that the
; dispatch line in deriv looked like
;((get (operator exp) 'deriv) (operands exp) var)
; What corresponding changes to the derivative system are re-
; quired?

; The order of the arguments (put) will need to be switched as they're getting from the table
; in a different order.
; For instance (put 'exponent '** exponent) will become (put '** 'exponent exponent)
