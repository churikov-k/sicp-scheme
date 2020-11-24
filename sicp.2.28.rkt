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
    
(define x (list (list 1 2) (list 3 4)))
x
(list x x)
(fringe x)
(fringe (list x x))