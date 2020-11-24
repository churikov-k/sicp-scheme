#lang sicp
(#%require sicp-pict)
;(paint einstein)
;(define wave paint)
;(define wave2 (beside wave (flip-vert wave)))
;(define wave4 (below wave2 wave2))

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

;(define (make-frame origin edge1 edge2)
;  (list origin edge1 edge2))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (cadr frame))

;(define (edge2-frame frame)
;  (caddr frame))

(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))
;
(define (edge2-frame frame)
  (cddr frame))

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v)
                           (edge1-frame frame))
               (scale-vect (ycor-vect v)
                           (edge2-frame frame))))))

;(define (segments->painter segment-list)
;  (lambda (frame)
;    (for-each
;     (lambda (segment)
;       (draw-line
;        ((frame-coord-map frame) (start-segment segment))
;        ((frame-coord-map frame) (end-segment segment))))
;     segment-list)))

;(define draw-line black)

(define make-segment cons)
(define start-segment car)
(define end-segment cdr)

(define v1 (make-vect 0 0))
(define v2 (make-vect 0.4 0.6))
(define v3 (make-vect 0.1 0.7))
;(add-vect v1 v2)
;(sub-vect v1 v2)
;(scale-vect 2 v1)
;(define fr (make-frame v1 v2 v3))
;(origin-frame fr)
;(edge1-frame fr)
;(edge2-frame fr)

(define segm1 (make-segment v1 v2))
(define segment-list (list segm1))
;(segments->painter segment-list)
(define wave
  (segments->painter
   (list
    (make-segment (make-vect 0.20 0.00) (make-vect 0.35 0.50))
    (make-segment (make-vect 0.35 0.50) (make-vect 0.30 0.60))
    (make-segment (make-vect 0.30 0.60) (make-vect 0.15 0.45))
    (make-segment (make-vect 0.15 0.45) (make-vect 0.00 0.60))
    (make-segment (make-vect 0.00 0.80) (make-vect 0.15 0.65))
    (make-segment (make-vect 0.15 0.65) (make-vect 0.30 0.70))
    (make-segment (make-vect 0.30 0.70) (make-vect 0.40 0.70))
    (make-segment (make-vect 0.40 0.70) (make-vect 0.35 0.85))
    (make-segment (make-vect 0.35 0.85) (make-vect 0.40 1.00))
    (make-segment (make-vect 0.60 1.00) (make-vect 0.65 0.85))
    (make-segment (make-vect 0.65 0.85) (make-vect 0.60 0.70))
    (make-segment (make-vect 0.60 0.70) (make-vect 0.75 0.70))
    (make-segment (make-vect 0.75 0.70) (make-vect 1.00 0.40))
    (make-segment (make-vect 1.00 0.20) (make-vect 0.60 0.48))
    (make-segment (make-vect 0.60 0.48) (make-vect 0.80 0.00))
    (make-segment (make-vect 0.40 0.00) (make-vect 0.50 0.30))
    (make-segment (make-vect 0.50 0.30) (make-vect 0.60 0.00)))))

;(define wave2 (beside wave (flip-vert wave)))
;(define wave4 (below wave2 wave2))

(define paintA
  (segments->painter
   (list
    (make-segment (make-vect 0 0) (make-vect 0 1))
    (make-segment (make-vect 0 0.99) (make-vect 1 0.99))
    (make-segment (make-vect 0.99 1) (make-vect 0.99 0))
    (make-segment (make-vect 1 0) (make-vect 0 0))
                  )))

(define paintB
  (segments->painter
   (list
    (make-segment (make-vect 0 0) (make-vect 1 1))
    (make-segment (make-vect 0 1) (make-vect 1 0)))))

(define paintC
  (segments->painter
   (list
    (make-segment (make-vect 0.5 0) (make-vect 1 0.5))
    (make-segment (make-vect 1 0.5) (make-vect 0.5 1))
    (make-segment (make-vect 0.5 1) (make-vect 0 0.5))
    (make-segment (make-vect 0 0.5) (make-vect 0.5 0)))))

(define (transform-painter painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
        (painter
         (make-frame new-origin
                     (sub-vect (m corner1) new-origin)
                     (sub-vect (m corner2) new-origin)))))))

(define (flip-vert painter)
(transform-painter painter
(make-vect 0.0 1.0) ; новая исходная точка
(make-vect 1.0 1.0) ; новый конец edge1
(make-vect 0.0 0.0))) ; новый конец edge2

(define (flip-horiz painter)
  (transform-painter painter
                     (make-vect 1.0 0.0) 
                     (make-vect 0.0 0.0) 
                     (make-vect 1.0 1.0)))

(define (rotate-180 painter)
  (transform-painter painter
                     (make-vect 1.0 1.0) 
                     (make-vect 0.0 1.0) 
                     (make-vect 1.0 0.0)))

(define (rotate-270 painter)
  (transform-painter painter
                     (make-vect 0.0 1.0) 
                     (make-vect 0.0 0.0) 
                     (make-vect 1.0 1.0)))

(define wave1
  (segments->painter
   (list
    (make-segment (make-vect 0.20 0.00) (make-vect 0.35 0.50))
    (make-segment (make-vect 0.35 0.50) (make-vect 0.30 0.60))
    (make-segment (make-vect 0.30 0.60) (make-vect 0.15 0.45))
    (make-segment (make-vect 0.15 0.45) (make-vect 0.00 0.60))
    (make-segment (make-vect 0.00 0.80) (make-vect 0.15 0.65))
    (make-segment (make-vect 0.15 0.65) (make-vect 0.30 0.70))
    (make-segment (make-vect 0.30 0.70) (make-vect 0.40 0.70))
    (make-segment (make-vect 0.40 0.70) (make-vect 0.35 0.85))
    (make-segment (make-vect 0.35 0.85) (make-vect 0.40 1.00))
    (make-segment (make-vect 0.60 1.00) (make-vect 0.65 0.85))
    (make-segment (make-vect 0.65 0.85) (make-vect 0.60 0.70))
    (make-segment (make-vect 0.60 0.70) (make-vect 0.75 0.70))
    (make-segment (make-vect 0.75 0.70) (make-vect 1.00 0.40))
    (make-segment (make-vect 1.00 0.20) (make-vect 0.60 0.48))
    (make-segment (make-vect 0.60 0.48) (make-vect 0.80 0.00))
    (make-segment (make-vect 0.40 0.00) (make-vect 0.50 0.30))
    (make-segment (make-vect 0.43 0.80) (make-vect 0.58 0.80))
    (make-segment (make-vect 0.50 0.30) (make-vect 0.60 0.00)))))

(define (corner-split1 painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((corner (corner-split painter (- n 1))))
          (beside (below painter up)
                  (below right corner))))))

(define (square-limit1 painter n)
  (let ((quarter (corner-split1 painter n)))
    (let ((half (below (flip-horiz quarter) quarter)))
      (beside (flip-vert half) half))))

(paint wave)
(paint wave1)
(paint (corner-split wave 3))
(paint (corner-split1 wave1 3))
;(paint (square-limit wave 3))
(paint (square-limit1 wave1 3))