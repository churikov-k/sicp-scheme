(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (square x ) (* x x))
(define (average x y) (/ (+ x y) 2))

(define tolerance 0.000001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))      
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (sqrt1 x)
  (fixed-point (average-damp (lambda (y) (/ x y)))
               1.0))

(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (square y))))
               1.0))

(define (iterative-improve is_enough? improve)
  (define (process x)
    (let ((next (improve x)))
      (if (is_enough? x next)
          next
          (process next))))
  process)

(define (fixed-pointNew f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (next x)
    (f x))   
  ((iterative-improve close-enough? next) first-guess))

(define (sqrtNew x)
  (fixed-pointNew (average-damp (lambda (y) (/ x y)))
               1.0))

(sqrt1 122)
(sqrtNew 122)

(define (cube-rootNew x)
  (fixed-pointNew (average-damp (lambda (y) (/ x (square y))))
               1.0))

(cube-root 27)
(cube-rootNew 27)

