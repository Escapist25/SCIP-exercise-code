(define (accumulate op initial seq)
  (if (null? seq)
    initial
    (op (car seq)
        (accumulate op initial (cdr seq)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (enumerate-interval st ed) 
  (if (> st ed)
    nil
    (cons st (enumerate-interval (+ st 1) ed))))

(define not-same? 
  (lambda (tl) 
    ;(display tl)
    (not (or (= (car tl) (cadr tl))
             (= (cadr tl) (caddr tl))
             (= (caddr tl) (car tl))))))
(define (fix-sum-pairs n) 
  (define (fsp n k) 
    ;(display n)
    ;(display k)
    ;(newline)
    (if (= k 1) 
      (list (list n)) 
      (flatmap (lambda (i)
                 (map (lambda (t-pair) (cons i t-pair))
                      (fsp (- n i) (- k 1))))
               (enumerate-interval 1 (- n 2)))))
  (filter not-same? (fsp n 3)))
(fix-sum-pairs 15)
