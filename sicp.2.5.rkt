(define (inc i) (+ i 1))

(define (power a n)
  (define (iter result k)
    (if (= k n)
        result
        (iter (* result a) (inc k))))
  (iter 1 0))

(define (cons3 a b)
  (* (power 2 a) (power 3 b)))

(define (car3 x)
  (define (iter result i)
    (if (= (remainder result 2) 0 )
        (iter (/ result 2) (inc i))
        i))
  (iter x 0))

(define (cdr3 x)
  (define (iter result i)
    (if (= (remainder result 3) 0 )
        (iter (/ result 3) (inc i))
        i))
  (iter x 0))

(define (t) (cons3 4621 359))
(t)
(car3 (t))
(cdr3 (t))