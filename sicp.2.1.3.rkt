(define (cons1 x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (error "Аргумент не 0 или 1 -- CONS" m))))
  dispatch)

(define (car1 z) (z 0))
(define (cdr1 z) (z 1))

(define (t) (cons1 2 3))
(car1 (t))
(cdr1 (t))