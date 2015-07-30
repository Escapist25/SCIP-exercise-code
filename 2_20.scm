(define (same-parity . w)
  (let ((first (remainder (car w) 2)))
   (define (par items)
     (if (null? items)
       items
       (if (= (remainder (car items) 2) first)
         (cons (car items) (par (cdr items)))
         (par (cdr items)))))
   (par w)))
(same-parity 2 3 4 5 6 7)

