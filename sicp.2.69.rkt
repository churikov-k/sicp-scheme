(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
(define (leaf? object)
  (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch
               (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "плохой бит -- CHOOSE-BRANCH" bit))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)
                               (cadr pair))
                    (make-leaf-set (cdr pairs))))))

(define (element-of-set? x set)
  (cond ((null? set) #false)
        ((equal? x (car set)) #true)
        (else (element-of-set? x (cdr set)))))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (define (encode-1 symbol current-branch)
    (if (leaf? current-branch)
        '()
        (let ((left-branch-symbols
               (symbols (left-branch current-branch))))
          (let ((right-branch-symbols
                 (symbols (right-branch current-branch))))
            (cond ((element-of-set? symbol left-branch-symbols)
                   (cons 0
                         (encode-1 symbol (left-branch current-branch))))
                  ((element-of-set? symbol right-branch-symbols)
                   (cons 1
                         (encode-1 symbol (right-branch current-branch))))
                  (else (error "No such symbol")))))))
  (encode-1 symbol tree))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge list)
  (if (null? (cdr list))
      (car list)
      (successive-merge (adjoin-set
                         (make-code-tree (car list) (cadr list))
                         (cddr list)))))
;
(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))
(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))
(decode sample-message sample-tree)
(encode (decode sample-message sample-tree)
        sample-tree)
(define pairs (list '(A 4) '(B 2) '(C 1) '(D 1) ))
pairs
;(define list (make-leaf-set pairs))
;list
;(car list)
;(cadr list)
;(cddr list)
;(make-code-tree (car list) (cadr list))
;(adjoin-set
;                         (make-code-tree (car list) (cadr list))
;                         (cdr list))
(define sample-tree-2 (generate-huffman-tree pairs)                        )
(decode sample-message sample-tree-2)
(encode (decode sample-message sample-tree-2)
        sample-tree-2)