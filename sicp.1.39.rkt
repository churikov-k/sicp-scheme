(define (tan-cf x k)
  (define (frac i result)
    (if (= i 0)
    (/ result x)
    (frac ((lambda (x) (- x 1)) i) (/ (* x x)  (- (koef i) result)))))
  (frac(- k 1) (/ (* x x) (koef k))))

(define (koef x) (+ (- x 1) x))

(tan-cf 0.7811 100)
