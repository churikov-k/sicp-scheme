(define (f k n)
  (cond ((or (= k 1) (= k n)) 1)
        (else (+ (f (- k 1) (- n 1)) (f k (- n 1)))))) 
  