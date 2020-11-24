
(define (reverse1 list1)
  (define (iter source dest)
    (if (null? (cdr source))
      (append (list (car source)) dest )
      (iter (cdr source) (append (list (car source)) dest ))))
  (iter list1 '()))



(define l (list 23 72 149 34))

(reverse1 l)