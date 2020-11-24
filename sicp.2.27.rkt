(define (reverse1 list1)
  (define (iter source dest)
    (if (null? source)
      dest
      (iter (cdr source) (cons (car source) dest ))))
  (iter list1 '()))

(define (deep-reverse list1)
  (define (process-item source)
    (if (pair? source)
        (iter source '())
        source))
  (define (iter source dest)
    (if (null? source)
      dest       
      (iter (cdr source) (cons (process-item (car source)) dest ))))
  (iter list1 '()))


(define x (list (list 1 2) (list 3 4)))
x

(reverse1 x)
(deep-reverse x)
