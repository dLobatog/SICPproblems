; Show that under the assumption of small percent-
; age tolerances there is a simple formula for the approximate per-
; centage tolerance of the product of two intervals in terms of the
; tolerances of the factors. You may simplify the problem by assum-
; ing that all numbers are positive.


;  [a,b] × [c,d] = [min (ac, ad, bc, bd), max (ac, ad, bc, bd)]
;
; Since we're assuming all positive numbers for this exercise, we can change the definition to a simpler form:
;
; [a,b] × [c,d] = [ac, bd]
;
; If Ca is center of a, and Ta is tolerance of a, a is the interval
;
;   a = [Ca*(1 - 0.5*Ta), Ca*(1 + 0.5*Ta)]
; and b is
;
;   b = [Cb*(1 - 0.5*Tb), Cb*(1 + 0.5*Tb)]
; If the endpoints are positive, a*b has the endpoints (after simplifying):
;
;   a*b = [Ca*Cb*(1 - 0.5*(Ta + Tb) + 0.25*Ta*Tb),
;          Ca*Cb*(1 + 0.5*(Ta + Tb) + 0.25*Ta*Tb)]

