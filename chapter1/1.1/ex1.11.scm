;; Exercise 1.11: A function f is defined by the rule that f ( n ) = n if n < 3
;; and f ( n ) = f ( n − 1 ) + 2 f ( n − 2 ) + 3 f ( n − 3 ) if n ≥ 3 . Write a
;; procedure that computes f by means of a recursive process. Write a procedure
;; that computes f by means of an iterative process.

(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

(define (f* n)
  (define (f-iter a b c n)
    (if (< n 3)
        a
        (f-iter (+ a (* 2 b) (* 3 c))
                a
                b
                (- n 1))))
  (f-iter 2 1 0 n))

#|
Para traducir un procedimiento recursivo en uno iterativo, es vital analizar el
caso base. Por ejemplo, en la versión recursiva, se ve que el caso base es
cuando n < 3.

¿Qué se calcula cuando n < 3? Se calcula f(2) + 2 * f(1) + 2 * f(0).
Por eso evaluar f(3) nos da 4 (2 + 2 * 1 + 0).

Entonces, tenemos que mantener en el "estado" los tres valores (en este
caso: a, b y c).

El nuevo valor de `a` se calcula usando a + 2*b + 3*c
El nuevo valor de `b` debería sería el valor anterior de a (que era f(n)), porque
ahora estaríamos retrocediendo un paso, y lo que era f(n) se convierte en f(n-1)
Y el nuevo valor de `c` sería el valor anterior de b (que era f(n-1)), porque
otra vez estaríamos retrocediendo un paso, y lo que era f(n-1) se convierte en f(n-2).

De esta forma computamos, paso por paso, cada iteración de `f`.

(= (f 5) (f* 5)) ; #t

|#
