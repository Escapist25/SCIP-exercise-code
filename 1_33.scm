(define (filter-accumulate fil combiner null-value term a next b)
  (define (getv t)
    (if (fil t)
      t
      null-value
      )
    )
  (if (> a b) 
    null-value
    (combiner (getv a) (filter-accumulate fil combiner null-value term (next a) next b))
    )
  ) 
(define (prime? n)
  (define (divides? a b)
    (= (remainder b a) 0)
    )
  (define (next x)
    (if (= x 2)
      3
      (+ x 2)
      )
    )
  (define (test a)
    (if (> (square a) n)
      #t
      (and (not (divides? a n)) (test (next a)))
      )
    )
  (if (< n 2)
    #f
    (test 2)
    )
  )
(define (solution1 a b) (filter-accumulate prime? + 0 (lambda (x) x) a (lambda (x) (+ x 1)) b) )

(solution1 1 100)




(define (mygcd x y)
  (if (< x y) 
    (mygcd y x)
    (if (= y 0)
      x
      (mygcd y (remainder x y))
      )
    )
  )

(define (solution2 n) 
  (define (diprime? x) 
    (= (gcd n x) 1)
    )
  (filter-accumulate diprime? * 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) n) 
  )

(solution2 6)
