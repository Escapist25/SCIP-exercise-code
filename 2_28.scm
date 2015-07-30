(define (fringe x)
  (define (iter x res)
    (if (null? x)
      res
      (iter (cdr x) (append res (fringe (car x))))))
  (if (not (pair? x))
    (list x)
    (iter x nil)))
(define a (list 1 2 (list 4 3) 4 (list (list 3 2) (list 2 1))))
a
(fringe a)
