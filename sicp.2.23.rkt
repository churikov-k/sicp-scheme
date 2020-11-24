(define (for-each1 proc items)
  (cond ((not (null? items))      
      (proc (car items))
       (for-each1 proc (cdr items)))))

(define (for-each2 proc items)
  (if (null? items)
      #t
      (begin (proc (car items))
       (for-each1 proc (cdr items)))))

(for-each1 (lambda (x) (newline) (display x))
(list 57 321 88))
(for-each2 (lambda (x) (newline) (display x))
(list 57 321 88))