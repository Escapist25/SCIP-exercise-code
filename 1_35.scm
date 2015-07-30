(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 0.001))
  (define (try guess)
    (let ((next (f guess)))
     (display guess)
     (newline)
     (if (close-enough? guess next)
       next
       (try next))))
  (try first-guess)) 
(fixed-point 
  (lambda 
    (x) 
    (+ 1 
       (/ 1 x))) 
  1.0)
