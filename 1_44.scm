(define dx 0.00001)
(define (average-by-transform f x y z)
  (/ (+ (f x) (f y) (f z)) 3))
(define (smooth-once f) 
  (lambda (x) (average-by-transform f x (- x dx) (+ x dx))))
(define (smooth f n)
  ((repeated smooth-once n) f))