(define x (list 1 3 (list 5 7) 9))
;also we can use (define x '(1 3 (5 7) 9))
(define y (list (list 7)))
(define z (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
x
y
z
(car (cdr (car(cdr (cdr x)))))
(car (car y))
(car  (cdr (car ( cdr(car (cdr (car (cdr (car (cdr (car (cdr z))))))))))))

(define (process-tree combiner leaf null-value tree)
  (cond ((null? tree) null-value)
        ((not (pair? tree)) (leaf tree))
        (else (combiner (process-tree combiner leaf null-value (car tree))
                        (process-tree combiner leaf null-value (cdr tree))))))
(define (combine l x)
  (map (lambda (a) (append a (list x))) l))

(define (find-path tree x)
  (process-tree (lambda (l r) (append (combine l 'car) (combine r 'cdr)))
                (lambda (a) (if (= a x) '(()) '()))
                '()
                tree))
(define x1 (list 1 3 (list 5 7) 7))