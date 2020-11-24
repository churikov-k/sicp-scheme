(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (filter predicate sequence)
  (cond ((null? sequence) '())
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (remove item sequence)
  (filter (lambda (x) (not (= x item)))
          sequence))

(define (permutations s)
  (if (null? s)
      (list '())
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (remove x s))))
               s)))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

; function to generate 3-combination of n
(define (combination n)
  (flatmap (lambda (x)
             (flatmap (lambda (y)
                        (map (lambda (z)
                               (list x y z))
                             (enumerate-interval (+ y 1) n)))
                      (enumerate-interval (+ x 1) (- n 1))))
           (enumerate-interval 1 (- n 2))))

; predicate 
(define (sum-equal-s? s seq)
  (= s (accumulate + 0 seq)))

(define (proc2.41 n s)     
  (filter (lambda (x) (sum-equal-s? s x))
          (flatmap permutations (combination n))))

(proc2.41 5 6)