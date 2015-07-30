;})
(define (deep-reverse items)
  (define (iter items nitems)
    (if (null? items)
      nitems
      (iter (cdr items) (cons (deep-reverse (car items)) nitems))))
  (if (not (pair? items))
    items
    (iter items nil)
    ))
(define a (list 1 2 (list 4 3) 4 (list (list 3 2) (list 2 1))))
a
(deep-reverse a)
