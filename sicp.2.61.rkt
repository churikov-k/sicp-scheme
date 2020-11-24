(define (element-of-set? x set)
  (cond ((null? set) #false)
        ((= x (car set)) #true)
        ((< x (car set)) #false)
        (else (element-of-set? x (cdr set)))))

(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1
                     (intersection-set (cdr set1)
                                       (cdr set2))))
              ((< x1 x2)
               (intersection-set (cdr set1) set2))
              ((< x2 x1)
               (intersection-set set1 (cdr set2)))))))

(define (adjoin-set x set)
  (define (insert prev elem post)
    (cond ((null? post) (append prev (list elem)))
          ((< elem (car post))
           (append (append prev (list elem)) post))
          (else (insert (append prev (list (car post))) elem (cdr post)))))
  (if (element-of-set? x set)
      set  
  (cond ((null? set) (list x))
        ((= x (car set)) set)
        ((< x (car set)) (cons x set))
        (else (insert (list (car set)) x (cdr set))))))


(define (union-set set1 set2)
  (append set1 set2))

;tests
(define set1 (adjoin-set 1 '()))
(define set1 (adjoin-set '2 set1))
(define set1 (adjoin-set '1 set1))
(define set1 (adjoin-set '4 set1))
(define set2 (adjoin-set 1 '()))
(define set2 (adjoin-set '5 set2))
(define set2 (adjoin-set '6 set2))
(define set2 (adjoin-set '4 set2))
set1
set2
(intersection-set set1 set2)
(union-set set1 set2)