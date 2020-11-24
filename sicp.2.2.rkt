(define (make-point x y)
  (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (p1)
  (make-point -2 3))

(print-point (p1))

(define (p2)
  (make-point 1 12))

(print-point (p2))

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment s) (car s))

(define (end-segment s) (cdr s))

(define (average x y) (/ (+ x y) 2.0))

(define (midpoint-segment s)
  (make-point
   (average (car (start-segment s)) (car (end-segment s)))
   (average (cdr (start-segment s)) (cdr (end-segment s)))))

(define (print-segment s)
  (newline)
  (display "(")
  (display (print-point (start-segment s)))
  (display ",")
  (display (print-point (end-segment s)))
  (display ")"))

(define (segment) (make-segment (p1) (p2)))
;(print-segment (segment))

(print-point (midpoint-segment (segment)))