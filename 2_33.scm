(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (map1 p sequence)
  (accumulate (lambda (x y) (append (list (p x)) y)) nil sequence))
(define (append1 seq1 seq2)
  (accumulate cons seq2 seq1))
(define (length1 sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence))

(map1 (lambda (x) (+ x 2)) `(1 2 4 5))
(define a `(1 2 3 4 6))
(define b `(2 3 4 5 9))
(append1 a b)
(length1 a)
