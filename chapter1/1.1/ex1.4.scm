; el ejercicio pide describir el comportamiento de
; (define (a-plus-abs-b a b)
;     ((if (> b 0) + -) a b))
; teniendo en cuenta nuestro modelo de evaluación permite
; tener una combinación de expresiones como operador

; la idea es sumar el modulo de "b" a "a", funciona porque
; si b fuera negativo, el if capta esto y se reemplaza por un -
; entonces - y -, +

; (define (a-plus-abs-b a b)
;     ((if (> b 0) + -) a b))

;> (a-plus-abs-b 2 3)
; (if (> 3 0) + -) 2 3)
; (+ 2 3)
; 5

;> (a-plus-abs-b 2 -3)
; (if (> -3 0) + -) 2 -3)
; (- 2 -3)
; 5
