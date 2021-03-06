(define (make-check-list)
  (define p `())
  (define (add x)
    (set! p (cons x p)))
  (define (reset)
    (set! p `()))
  (define (check x)
    (pair? (memq x p)))
  (define (dispatch op)
    (cond ((eq? op `check) check)
          ((eq? op `add) add)
          ((eq? op `reset) reset))))
(pair? `())
