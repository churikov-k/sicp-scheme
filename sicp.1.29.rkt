(define (simpson f a b n) 
  (define h (/ (- b a) n)) 
  (define (g k) 
    (define (c k) 
      (cond ((= k 0) 1) 
            ((= k n) 1) 
            ((even? k) 2) 
            (else 4))) 
    (* (c k) (f (+ a (* k h))))) 
  (/ (* (sum g 0 inc n) h) 3))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (cube x) (* x x x))
(define (inc n) (+ n 1))