(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right) (list entry left right))
(define (adjoin-set x set)
  (cond ((null? set) (make-tree x nil nil)) 
        ((= x (entry set)) set)
        ((< x (entry set))
         (make-tree (entry set) 
                    (adjoin-set x (left-branch set)) 
                    (right-branch set)))
        ((> x (entry set))
         (make-tree (entry set)
                    (left-branch set)
                    (adjoin-set x (right-branch set))))))
(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((= x (entry set)) set)
        ((< x (entry set)) (element-of-set? x (left-branch set)))
        ((> x (entry set)) (element-of-set? x (right-branch set)))))
(define t-tree `(3 (1 () (2 () ())) (5 (4 () ()) ())))
(define (tree->list tree)
  (define (iter tree converted-list)
    (if (null? tree)
      converted-list
      (iter (left-branch tree) 
            (cons (entry tree) 
                  (iter (right-branch tree) converted-list)))))
  (iter tree `()))
(define list->tree 
  (lambda (tree) 
    (car (partial-tree tree (length tree)))))
(define (partial-tree elts n)
  (if (= n 0)
    (cons `() elts)
    (let ((left-size (quotient n 2)))
     (let ((left-result (partial-tree elts left-size)))
      (let ((left-tree (car left-result)) 
            (remain-elts (cdr left-result))
            (right-size (- n 1 left-size))) 
        (let ((this-entry (car remain-elts))
              (right-result 
                (if (= right-size 0)
                  (cons `() (cdr remain-elts)) 
                  (partial-tree (cdr remain-elts) right-size))))
          (let ((right-tree (car right-result))
                (remain-elts-r (cdr right-result)))
            (cons (make-tree this-entry left-tree right-tree) remain-elts-r))))))))
(define (union-list list1 list2)
    (cond ((null? list1) list2)
          ((null? list2) list1)
          ((= (car list1) (car list2)) 
           (union-list list1 (cdr list2)))
          ((< (car list1) (car list2)) 
           (cons (car list1) (union-list (cdr list1) list2)))
          ((> (car list1) (car list2)) 
           (cons (car list2) 
                 (union-list list1 (cdr list2))))))
(define (intersection-list list1 list2)
    (cond ((or (null? list1) (null? list2)) `())
          ((= (car list1) (car list2)) 
           (cons (car list1) 
                 (intersection-list (cdr list1) (cdr list2))))
          ((< (car list1) (car list2)) 
           (intersection-list (cdr list1) list2))
          ((> (car list1) (car list2)) 
           (intersection-list list1 (cdr list2)))))
(union-list `(1 3 4 5 6) `(2 4 6 7 9))
(intersection-list `(1 3 4 5 6) `(2 4 6 7 9))
(define (union-set set1 set2)
  (union-list (tree->list set1) (tree->list set2)) )
(define (intersection-set set1 set2)
  (intersection-list (tree->list set1) (tree->list set2)))
(list->tree (tree->list t-tree))