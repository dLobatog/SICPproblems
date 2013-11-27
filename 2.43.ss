; Louis Reasoner is having a terrible time doing
; Exercise 2.42. His queens procedure seems to work, but it runs
; extremely slowly. (Louis never does manage to wait long enough
;     for it to solve even the 6 × 6 case.) When Louis asks Eva Lu Ator
; for help, she points out that he has interchanged the order of the
; nested mappings in the flatmap , writing it as

(flatmap
  (lambda (new-row)
    (map (lambda (rest-of-queens)
           (adjoin-position new-row k rest-of-queens))
         (queen-cols (- k 1))))
  (enumerate-interval 1 board-size))

; Explain why this interchange makes the program run slowly.
; Estimate how long it will take Louis’s program to solve the
; eight-queens puzzle, assuming that the program in Exercise 2.42
; solves the puzzle in time T .


; Solution:
;
; Original version runs queen-cols once per column, that is, it
; computes the solution for k = 1..board-size. This procedure gets
; the result board arrangements for the queen problems solved.
;
; This version computes this solution 'board-size' times , because the
; inner lambda is run (enumerate-interval 1 board-size) times, that is,
; board-size times.
; These computations are recursive, so it will generate a tree in the
; heap with (queen-cols) calls, many of which will be repeated.
;
; The number of times this computation will appear in the tree is
; a geometric progression.
;
; Hence every call to (queen k) will require board-size × (queen k−1) calls.
; Therefore, we need around board-size * board-size calls to queen-cols using Louis' code.
;
; If we assume that the recursive call to queen-cols to be our basis for the running time
; of the queens procedure, then T should be proportional to board-size.
;
; Hence, Louis Reasoner's code should take around T^board-size time to compute.
; (queen-cols board-size ) * (queen-cols board-size) * ..... <--- this, 'board-size' times
;
;
