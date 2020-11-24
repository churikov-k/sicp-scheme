(define (inc x) (+ x 1))

(define (square x) (* x x))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter i result)
    (if (= i n)
        result
        (iter (inc i) (compose f result))))
    (iter 1 f))


