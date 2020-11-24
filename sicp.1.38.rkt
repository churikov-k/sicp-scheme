(define (cont-frac n d k)
  (define (frac i)
    (if (= i k)
    (/ (n k) (d k))
    (/ (n i) (+ (d i) (frac ((lambda (x) (+ 1 x)) i))))))
  (frac 1))

(define (cont-fracI n d k)
  (define (frac i result)
    (if (= i 0)
    result
    (frac ((lambda (x) (- x 1)) i) (/ (n i) (+ (d i) result)))))
  (frac (- k 1) (/(n k) (d k))))

(define (d i)
  (if (= (remainder i 3) 2)
      (*(+(/(- i 2)3)1)2)
      1))
  

(+(cont-frac (lambda (i) 1.0)
           d
           15)2)


(+(cont-fracI (lambda (i) 1.0)
           d
           15)2)