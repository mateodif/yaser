;(define (p) (p))
;(define (test x y)
;(if (= x 0) 0 y))

; nos piden determinar la diferencia entre el comportamiento de
;(test 0 (p))
; en un interprete de orden aplicativo vs orden normal

; recordatorio:
; orden aplicativo -> evaluar los argumentos y luego aplicar
; orden normal -> expander de forma completa y luego reducir

; al evaluar una combinación, el orden aplicativo evalua los operandos
; y operadores de la combinación ANTES de aplicar el procedimiento resultante (operador)
; a los argumentos resultantes (operandos)
;
; el orden normal solo evalua un operando cuando el procedimiento requiere su valor

; orden aplicativo:
;> (test 0 (p))
;> (test 0 (p))
;> ...

; orden normal:
;> (test 0 (p))
; el if es una forma especial, la cual evalua su predicado antes de elegir evaluar la
; consecuencia o la alternativa
;> (if (= x 0) 0 y)
; en este caso, el predicado del if es (= x 0), asi que se necesita evaluar x para
; determinar el valor del predicado
; esto significa que no se necesita evaluar "y" todavia
;> (if (= 0 0) 0 y)
;> 0
