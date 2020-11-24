(define (double a)
  (+ a a))
(define (halve a)
  (/ a 2))
(define (f* a b)
  (iter* a b 0))
(define (iter* a b r)
  (cond ((= b 0) r)
        ((even? b) (iter* (double a) (halve b) r))
        (else (iter* a (- b 1) (+ r a)))))

        