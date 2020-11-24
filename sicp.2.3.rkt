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

;(print-point (midpoint-segment (segment)))

(define (x-distance p1 p2)
  (abs (- (x-point p1) (x-point p2))))

(define (y-distance p1 p2)
  (abs (- (y-point p1) (y-point p2))))

(define (rectangle vertex1 vertex2)
  (cons vertex1 vertex2))

(define (width rectangle)
  (x-distance (car rectangle) (cdr rectangle)))

(define (height rectangle)
  (y-distance (car rectangle) (cdr rectangle)))

(define (perimetr rectangle)
  (* 2 (+ (width rectangle) (height rectangle))))

(define (area rectangle)
  (* (width rectangle) (height rectangle)))

(define (rec) (rectangle (p1) (p2)))

(width (rec))
(height (rec))
(perimetr (rec))
(area (rec))

(define (rectangle1 segment1 segment2)
  (cons segment1 segment2))

(define (width1 rectangle)
  (x-distance (start-segment (car rectangle)) (end-segment (car rectangle))))

(define (height1 rectangle)
  (y-distance (start-segment (cdr rectangle)) (end-segment (cdr rectangle))))

(define (seg1) (make-segment (p1) (make-point 1 3)))
(define (seg2) (make-segment (make-point 1 3) (p2)))
(seg1)
(seg2)

(define (perimetr1 rectangle)
  (* 2 (+ (width1 rectangle) (height1 rectangle))))

(define (area1 rectangle)
  (* (width1 rectangle) (height1 rectangle)))

(define (rec1) (rectangle1 (seg1) (seg2)))
(width1 (rec1))
(height1 (rec1))
(perimetr1 (rec1))
(area1 (rec1))
; also we can make selectors for vertexs in both cases for more strength abstract bariers