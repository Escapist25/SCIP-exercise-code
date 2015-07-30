(define (make-rat x y) 
  (define  (in-make-rat x y)
   (let ((g (gcd x y))) 
   (cons (/ x g) (/ y g))) )
  (if (> y 0)
    (in-make-rat x y)
    (in-make-rat (- x) (- y)))
  )
(define (numer z ) (car z))
(define (denom z ) (cdr z))

(define (add-rat a b) 
  (make-rat (+ 
              (* (numer a) (denom b)) 
              (* (denom a) (numer b)))
            (* (denom a) (denom b))))

(define (sub-rat a b)
  (make-rat (-
              (* (numer a) (denom b)) 
              (* (numer b) (denom a)))
            (* (denom a) (denom b))))

(define (mul-rat a b)
  (make-rat (* (numer a) (numer b))
            (* (denom a) (denom b))))

(define (div-rat a b)
  (make-rat (* (numer a) (denom b))
            (* (denom a) (numer b))))

(define (equal-rat? a b)
  (= (* (numer a) (denom b))
     (* (denom b) (numer a))))

(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline))

(define one-half (make-rat -1 2))
(print-rat one-half)
(define one-third (make-rat -1 -3))
(print-rat (add-rat one-half one-third))

