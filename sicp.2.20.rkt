
(define (same-parity x . w)
  (define (is-same-parity? x y)
    (= (remainder x 2) (remainder y 2)))  
  (define (iter seq result)
    (if (null? seq)
      result
      (if (is-same-parity? x (car seq))
          (iter (cdr seq) (append result (list (car seq)) ))
          (iter (cdr seq) result))))
  (iter w (list x)))

; run examples
(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)