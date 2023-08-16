#|
Exercise 1.12: The following pattern of numbers is called Pascal’s triangle.

         1
       1   1
     1   2   1
   1   3   3   1
 1   4   6   4   1
       . . .

The numbers at the edge of the triangle are all 1, and each number inside the
triangle is the sum of the two numbers above it. Write a procedure that
computes elements of Pascal’s triangle by means of a recursive process.
|#

#|

Bueno, para resolver este ejercicio primero hay que darse cuenta del patrón del
triángulo de Pascal.

1
1 1
1 2 1
1 3 3 1
1 4 6 4 1

Primero, establezcamos una forma de referirnos a cualquier valor del triángulo.
La forma natural es usar fila y columna. Por ejemplo, para referirnos al primer
dos que aparece, podríamos decir fila = 3 y columna = 2.

Segundo, podemos hacer algunas conclusiones sobre que valores podemos calcular siempre.
Por ejemplo, sabemos que el primer y último valor de cada fila va a ser un uno.
También sabemos que el crecimiento es lineal con respecto a la fila. En la fila tres
tenemos tres números, en la fila cinco tenemos cinco números, etc...

Luego, al tener ya los casos base, podemos calcular el valor de una fila-columna
determinada usando recursión.

|#

(define (pascal row column)
  (cond [(= row 1) 1]
        [(= column 1) 1]
        [(= row column) 1]
        [else (+ (pascal (- row 1) (- column 1))
                 (pascal (- row 1) column))]))

;; podemos hacer una función para que nos imprima un triangulito lindo

(define (display-pascal-row n)
  (define (column-iter i)
    (display (pascal n i))
    (display " ")
    (if (= i n)
        (newline)
        (column-iter (+ i 1))))
  (column-iter 1))

(define (display-pascal n)
  (define (display-pascal-iter i)
    (display-pascal-row i)
    (if (= i n)
        (newline)
        (display-pascal-iter (+ i 1))))
  (display-pascal-iter 1))

;; (display-pascal 9)
