; uses function fringe from exercise 2.28
(define (fringe items)
  (define (iter source dest)
    (if (null? source)
        dest
        (iter (cdr source) (append dest (process-item (car source))))))
  (define (process-item source)
    (if (pair? source)
        (iter source '())
        (list source)))
  (iter items '()))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate + 0 (map (lambda(x) 1) (fringe t))))

(define x (cons (list 1 2) (list 3 4 5)))

(count-leaves x)
(count-leaves (list x x))
