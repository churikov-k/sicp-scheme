(define (equal1? list1 list2)
  (or (and (null? list1)
           (null? list2))
      (and (symbol? list1)
           (symbol? list2)
           (eq? list1 list2))
      (and (number? list1) 
           (number? list2) 
           (= list1 list2))       
      (and (pair? list1)
           (pair? list2)
           (equal1? (car list1) (car list2))
           (equal1? (cdr list1) (cdr list2)))))
                  
  

(equal1? '1d '1d)