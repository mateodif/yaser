; Nos piden explicar que pasa cuando se intenta usar una versión de if
; hecha con cond para re-escribir el programa detallado en 1.1.7 (sqrt-iter)

; programa original:
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

;(define (good-enough? guess x)
;  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; programa con new-if
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))


;; (define (sqrt-iter guess x)
;;   (new-if (good-enough? guess x)
;;           guess
;;           (sqrt-iter (improve guess x) x)))

; el interprete queda colgado en un loop infinito
; la razón es que "if" es una forma especial la cual evalua el predicado
; y solo despues de evaluar el predicado decide evaluar o la consecuencia
; o la alternativa
; en cambio, con el "new-if", se evaluan todos los operandos a la vez,
; lo cual hace que se vaya mejorando la estimación pero que nunca llegue
; a la clausula final
