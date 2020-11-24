(define (f n)
  (if (< n 3)
      n
  (+(+ (f (- n 1)) (f (- n 2))( f (- n 3))))))

(define (g n)
  (g-iter 0 1 2 n ))
(define (g-iter c b a n)
  (if (< n 3)
      a
      (g-iter b a (+ a b c ) (- n 1))))