; Queens problem:
;
; How to place n queens on a chess board so that none of them is in
; check from any other?
(load "2.40.ss")

(define (make-position row column)
 (cons row column))

(define (get-row position)
 (car position))

(define (get-column position)
 (cdr position))

; Checks if the queen at the nth column is safe.
; Note it does not check any other columns (n-1, etc...)
(define (safe? col positions)
  (let ((kth-queen (list-ref positions (- col 1)))
        (other-queens (filter (lambda (q)
                                (not (= col (get-column q))))
                              positions)))
    (define (attacks? q1 q2)
      (or (= (get-row q1) (get-row q2))
          (= (abs (- (get-row q1) (get-row q2)))
             (abs (- (get-column q1) (get-column q2))))))
    (define (iter q board)
      (or (null? board)
          (and (not (attacks? q (car board)))
               (iter q (cdr board)))))
    (iter kth-queen other-queens)))

(define (adjoin-position new-row new-column positions)
 (append positions (list (make-position new-row new-column))))

(define empty-board `())

(define (queens board-size)
  (define (queen-cols k) ; Seq of all ways to place queens in the first k cols
    (if (= k 0)
      (list empty-board)
      (filter
        (lambda (positions) (safe? k positions))
        (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row
                                    k
                                    rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

;]=> (queens 1)
;
;;Value: (((1 . 1)))
;
;]=> (queens 2)
;
;;Value: ()
;
;]=> (queens 3)
;
;;Value: ()
;;
;]=> (queens 4)
;;
;;Value: (((2 . 1) (4 . 2) (1 . 3) (3 . 4)) ((3 . 1) (1 . 2) (4 . 3) (2 . 4)))
