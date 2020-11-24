(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda(x) (dot-product v x)) m))

(define (transpose mat)
  (accumulate-n cons '() mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda(x)
           (map (lambda(y) (dot-product y x))
                cols))
           m)))
;the second case
(define (matrix-*-matrix2 m n)
  (let ((cols (transpose n)))
    (map (lambda(x) (matrix-*-vector cols x)) m)))

;outputs
(define m1 '((1 2 3 4) (4 5 6 0) (6 7 8 9)))
(define m2 '((1 2 3) (4 5 6) (7 8 9)))
(define v1 '(1 2 3 4))
(define v2 '(1 2 3 4))

(dot-product v1 v2)
(matrix-*-vector m1 v1)
(transpose m1)
(matrix-*-matrix m2 m2)
(matrix-*-matrix2 m2 m2)