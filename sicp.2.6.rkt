(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;(add1 zero)
;((lambda (f) (lambda (x) (f ((n f) x)))) zero)
;(lambda (f) (lambda (x) (f ((zero f) x)))) 
;(lambda (f) (lambda (x) (f (((lambda (a) (lambda (b) b)) f) x))))
;(lambda (f) (lambda (x) (f ( (lambda (b) b)  x))))
;(lambda (f) (lambda (x) (f    x)))

(define one 
  (lambda (f) (lambda (x) (f x))))

;(add-1 one)
;((lambda (f) (lambda (x) (f ((n f) x)))) one)
;(lambda (f) (lambda (x) (f ((one f) x))))
;(lambda (f) (lambda (x) (f (((lambda (a) (lambda (b) (a b))) f) x))))
;(lambda (f) (lambda (x) (f ( (lambda (b) (f b))  x))))
;(lambda (f) (lambda (x) (f  (f x)  )))

(define  two
  (lambda (f) (lambda (x) (f (f x)))))

;I did not understand the next definition
 (define (add a b) 
   (lambda (f) 
     (lambda (x) 
       ((a f) ((b f) x))))) 

(define (inc i) (+ i 1))
(define (identity i) i)

((zero identity) 0)
((one identity) 1)
(((add-1 zero) identity) 3)
(((add-1 zero) inc) 3)
(((add-1 one) identity) 3)
(((add-1 one) inc) 3)
(((add zero two) inc) 2)