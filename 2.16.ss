; Explain, in general, why equivalent algebraic
; expressions may lead to different answers. Can you devise an
; interval-arithmetic package that does not have this shortcoming,
; or is this task impossible?

; As explained before, the main reason is the inability to present
; floating point numbers of arbitrary precision. At best we can just try
; to avoid repeating variables in our formulas, which is easy to do
; up to a point.
;
; The IEEE has a group working on a standard for this
; http://grouper.ieee.org/groups/1788/
;
