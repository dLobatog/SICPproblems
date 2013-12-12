; Implement the lookup procedure for the case where
; the set of records is structured as a binary tree, ordered by the nu-
; merical values of the keys.

(define (lookup given-key set-of-records)
  (cond ((null? set-of-records) false)
        ((> given-key (key (car set-of-records))) (lookup given-key (left-branch set-of-records)))
        ((< given-key (key (car set-of-records))) (lookup given-key (right-branch set-of-records)))
        ((= given-key (key (car set-of-records))) (car set-of-records))))
