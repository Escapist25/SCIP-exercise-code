(define (cont-frac n d k)
  (define (cal i)
    (if (> i k)
      0
      (/ (n i) (+ (d i) (cal (+ i 1))))))
  (cal 1)) 
(define (n i) 1.0)
(define (d i) 
  (* 1.0 
     (if (= 2 (remainder i 3))
       (/ (+ i 1) 3/2)
       1)))

(display (cont-frac n d 1000) )
