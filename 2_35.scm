(define (count-leaves t)
  (accumulate (lambda (x y) (+ y (if (pair? x) (count-leaves x) 1)) ) 0 t))
(define (count-leaves1 t)
  (accumulate + 0 (map (lambda (x) (if (pair? x) (count-leaves1 x) 1)) t)))
(define t (list 1 2 (list 2 3) (list 2 (list 4 6) 3) 5))
t
(count-leaves t)
(count-leaves1 t)
