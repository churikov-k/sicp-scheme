(define (square-list items)
  (map (lambda (x) (* x x)) items))

(define (square-list1 items)
  (if (null? items)
      (list)
      (cons (* (car items) (car items))
            (square-list1 (cdr items)))))

(square-list (list 1 2 3 4))
(square-list1 (list 1 2 3 4))