#lang sicp
(#%require sicp-pict)
;(paint einstein)
(define wave paint)
(define wave2 (beside wave (flip-vert wave)))
(define wave4 (below wave2 wave2))

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter (below smaller smaller)))))

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

(define (square-limit painter n)
  (let ((quarter (corner-split painter n)))
    (let ((half (beside (flip-horiz quarter) quarter)))
      (below (flip-vert half) half))))

(define (split first second)
  (define (splitI painter n)
    (if (= n 0)
        painter
        (let ((smaller (splitI painter (- n 1))))
          (first painter (second smaller smaller)))))
  splitI) 
     
(define (make-vect x y)
  (cons x y))

(define (xcor-vect v)
  (car v))

(define (ycor-vect v)
  (cdr v))

(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1) (xcor-vect v2))
             (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1) (xcor-vect v2))
             (- (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect k v)
  (make-vect (* (xcor-vect v) k)
             (* (ycor-vect v) k)))

(define v1 (make-vect 0.3 0.5))
(define v2 (make-vect 0.4 0.6))
(add-vect v1 v2)
(sub-vect v1 v2)
(scale-vect 2 v1)