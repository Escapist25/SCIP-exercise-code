(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 0.001))
  (define (try guess)
    (let ((next (/ (+ guess (f guess)) 2)))
     (display guess)
     (newline)
     (if (close-enough? guess next)
       next
       (try next))))
  (try first-guess)) 
(fixed-point (lambda (x) (/ (log 1000) (log x)))  2.0 )
