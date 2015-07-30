(define (fast-expt b n)
  (define (fexpt b n texp a)
    (if (= n 0) a
      (if (even? n)
        (fexpt b (quotient n 2) (* texp texp) a)
        (fexpt b (quotient n 2) (* texp texp) (* a texp))
        )
      )
    )
  (fexpt b n b 1)
  )
(fast-expt 5 5)
(display (fast-expt 2 1000))