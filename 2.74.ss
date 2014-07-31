; a. First, let’s define a generic file as a tagged file type that contains the
division it belongs to:

(define (make-generic-file division file)
  (list division file))

(define (division-of-generic-file gf)
  (car gf))

(define (file-of-generic-file gf)
  (cadr gf))

; make-generic-file takes a division name and a file object and builds a generic file object. The other two functions are simple accessors.

; With this in hand, we can write get-record as follows:

(define (get-record employee file)
  ((get 'get-record
        (division-of-generic-file file))
    employee
    (file-of-generic-file file)))

; It applies the generic operation get-record to the employee and the file. It does this by first fetching the appropriate get-record for the division with which the file is tagged, and then calling it on the employee and the actual file.

; b. Similarly to get-record, we can assume we have accessors for a generic employee object and write:

(define (get-salary employee)
  ((get 'get-salary
        (division-of-generic-employee employee))
    (employee-of-generic-employee employee)))

; c. In Common Lisp I’d use one of the plethora of find functions. In Scheme, they’re not part of the standard but are commonly available as extensions. Here is the implementation, using findf from PLT Scheme’s library of list utilities.

(require (lib "list.ss"))

(define (find-employee-record employee file-list)
  (findf
    (lambda (f)
      (let ((r (get-record employee f)))
        (if (null? r)
          #f
          r)))
    file-list))

; Note the translation from '() to #f, since Scheme considers the empty list to be true in boolean expressions.

; d. It needs to add the functions that know how to extract employee records from its own file format, and install them in the dispatch table with put.
