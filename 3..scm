(define (f n)
  (if (> 3 n)
    n
    (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))
    )
  )
(display (f 10))

(display (sqrt 5))
