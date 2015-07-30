(define a (list 1 (list 2 (list 3 4) (list 5))))
(define (tree-map opt tree)
  (map (lambda (tree) 
         (if (pair? tree)
           (tree-map opt tree)
           (opt tree))) 
       tree))
(define (square-tree tree) (tree-map square tree))
(square-tree a)
