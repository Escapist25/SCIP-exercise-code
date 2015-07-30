(define a (cons 5 3))
(set-car! a 3)
a

(define (last-pair p)
  (if (null? (cdr p))
    p
    (last-pair (cdr p))))
(define (append! x y)
  (set-cdr! (last-pair x) y))
(define x `(a b))
(define y `(c d))
(define z (append x y))
(define w (append! x y))
(define (make-cycle x)
  (set-cdr! (last-pair x) x) x)
(define z (make-cycle `(a b c)))

