; Eva Lu Ator types to the interpreter the expression
(car ”abracadabra)
; To her surprise, the interpreter prints back quote . Explain.

; The expression ''abracadabra is internally a list like (quote (quote abracadabra))
; so its understandable that 'quote' without anything after, is printed like 'quote'.

