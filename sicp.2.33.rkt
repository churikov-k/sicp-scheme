(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map1 p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence))

(define (append1 seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length1 sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

(map1 (lambda (x) (* 2 x)) '(1 2 3))
(append1 '(1 2 3) '(4 5 6))
(length1 '(1 2 3 4 5))