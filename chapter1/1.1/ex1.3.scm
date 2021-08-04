(define (square x) (* x x))
(define (sum-of-squares x y) (+ (square x) (square y)))
; (> x y z)
; (and (> x y) (> y z))
(define (largest-of-two x y)
  (cond ((> x y) x)
        ((< x y) y)
        (else x)))

(define (largest-of-three x y z) (largest-of-two (largest-of-two x y) (largest-of-two y z)))

(define (sum-of-squares-of-largest-two-numbers x y z)
    (sum-of-squares (largest-of-two x y) (largest-of-two y z)))
