; nos dicen que el procedimiento good-enough? no es efectivo al querer hallar
; las raices cuadradas de numeros muy chiquitos o muy grandes
; nos piden explicar estos hechos y dar ejemplos

; resulta que mi primer conclusión era errada, no era cuestión de memoria o cpu el problema
; era cuestión de que, en el caso de los numeros muy chicos, la raiz cuadrada no es lo suficientemente
; precisa. por ejemplo 0.00000004. el resultado correcto es 0.0002. sin embargo:
;> (sqrt 0.00000004)
;> 0.03125.....
; ^ esta es la tercera iteración
; la próxima iteración sería 0.0009, la cual está por debajo del limite (0.001)

; con numeros muy muy grandes, pasa algo diferente:
; eventualmente, la "guess" se vuelve muy parecida a x, lo cual causa un redondeo a x
; al ser x = guess, no hay precisión suficiente para calcular un average
; y causa que el interprete entre en un loop infinito

(define (good-enough? guess x)
  (< (/ (abs (- (improve guess x) guess)) guess) 0.000000005))
