(define dx 0.000001)
(define square (lambda (x) (* x x)))
(define (deriv g)
  (lambda (x) 
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newton-transform g)
  (lambda (x)
    (- x 
       (/ 
           (g x) 
           ((deriv g) x)))))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 0.0001))
  (define (try guess)
    (let ((next (f guess)))
     (display guess)
     (newline)
     (if (close-enough? guess next)
       next
       (try next))))
  (try first-guess)) 
(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (mysqrt x)
  (newtons-method (lambda (y) (- (square y) x)) 1.0))

(define (cubic a b c) 
  (lambda (x) (+ c
                 (* x (+ b
                         (* x (+ a x)))))))
;(display ((cubic 3 3 1) 5))
(display (newtons-method (cubic 3 3 1) 1.0))
;(display (mysqrt 9.0))
