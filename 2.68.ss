(load "2.67.ss")
; The encode procedure takes as arguments a mes-
; sage and a tree and produces the list of bits that gives the encoded
; message.

(define (encode message tree)
  (if (null? message)
    '()
    (append (encode-symbol (car message) tree)
            (encode (cdr message) tree))))

; Encode-symbol is a procedure, which you must write, that returns
; the list of bits that encodes a given symbol according to a given
; tree. You should design encode-symbol so that it signals an error if
; the symbol is not in the tree at all. Test your procedure by encoding
; the result you obtained in Exercise 2.67 with the sample tree and
; seeing whether it is the same as the original sample message.

(define (encode-symbol sym tree)
  (define (get-encoding branch)
    (cond ((leaf? branch) '())
          ((element-of-set? sym
                            (symbols (left-branch branch)))
           (cons 0 (get-encoding (left-branch branch))))
          ((element-of-set? sym
                            (symbols (right-branch branch)))
           (cons 1 (get-encoding (right-branch branch))))))
  (if (element-of-set? sym (symbols tree))
      (get-encoding tree)
      (error "Symbol not part of encoding set")))

(encode sample-message sample-tree)

