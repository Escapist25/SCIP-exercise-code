(define (f n)
  (define (calf f1 f2 f3 k)
    (if (= k n)
      f3
      (calf f2 f3 
            (+ f3 (* 2 f2) (* 3 f1))
            (+ k 1))
      )
    )
  (if (< n 3)
    3
    (calf 0 1 2 2)
    )
  )
(display (f 10))
