(define (cons2 x y)
  (lambda (m) (m x y)))

(define (car2 z)
  (z (lambda (p q) p)))

(define (cdr2 z)
  (z (lambda (p q) q)))

(define (t) (cons2 2 3))
(car2 (t))
(cdr2 (t))