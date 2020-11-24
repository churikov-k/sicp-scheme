(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

(define (total-weight mobile)
  (cond ((null? mobile) 0)
        ((not (pair? mobile)) mobile)
        (else (+ (total-weight (left-branch mobile)) 
                 (total-weight (right-branch mobile))))))

(define (rotate-moment? branch)
  (if (pair? branch)
      (* (branch-length branch) (total-weight (branch-structure branch)))
      0))

(define (balanced-single? mobile)
  (= (rotate-moment? (left-branch mobile))
     (rotate-moment? (right-branch mobile))))

(define (balanced? mobile)
  (cond ((null? mobile) #t)
        ((not (pair? mobile)) #t)
        (else (and (balanced? (branch-structure(left-branch mobile)))
                   (balanced-single? mobile)                   
                 (balanced? (branch-structure(right-branch mobile)))))))

;define some mobiles       
(define 1b (make-branch 1 2))
(define balanced-mob1 (make-mobile 1b 1b))
(define 2b (make-branch 1 balanced-mob1))
(define unbalanced-mob (make-mobile 1b 2b))
(define balanced-mob2 (make-mobile 2b 2b))

;output results
balanced-mob1
unbalanced-mob
balanced-mob2
(balanced? balanced-mob1)
(balanced? unbalanced-mob)
(balanced? balanced-mob2)

