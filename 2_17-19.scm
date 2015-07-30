(define (last-pair items)
  (if (null? (cdr items))
    (car items)
    (last-pair (cdr items))))
(define (myreverse items)
  (define (myrev items nitems)
    (if (null? items)
      nitems
      (myrev (cdr items) (cons (car items) nitems))))
  (myrev items nil))
(myreverse (list 9 7 5 3 1))

(last-pair a)
