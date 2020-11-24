(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (if (<= (* (upper-bound y) (lower-bound y)) 0)
      (display "the interval intersect zero")
      (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y))))))

(define (make-interval a b) (cons a b))

(define (upper-bound i) (cdr i))
(define (lower-bound i) (car i))

(define (sub-interval x y) 
  (make-interval (- (lower-bound x) (upper-bound y)) 
                 (- (upper-bound x) (lower-bound y))))

(define (f1) (make-interval 1 10))
(define (f2) (make-interval -1 3))
(div-interval (f1) (f2))