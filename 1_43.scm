(define (compose f g)
  (lambda (x) (f (g x))))
(define (repeated f times)
  (if (= times 1) 
    f
    (compose f (repeated f (- times 1)))))
(define (square x) (* x x))
(display ((repeated square 2) 5))
