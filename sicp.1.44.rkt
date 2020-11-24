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

(define dx 0.1)

(define (smooth f)
  (lambda (x)
    (/ (+ (f (+ x dx)) (f x) (f (- x dx))) 3)))

(define (smooth-n f n)
  ((repeated (lambda (g) (smooth g)) n) f))

((smooth square) 3)
((smooth-n square 5) 3)