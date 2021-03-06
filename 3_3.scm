(define call-the-cops xxxxxxxxxxxxx)
(define (make-account balance pass)
  (define err-times 0)
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "Insufficient funds"))
  (define (deposit amount) 
    (set! balance (+ balance amount))
    balance)
  (define (dispatch password m)
    (if (eq? password pass)
      (begin (cond ((eq? m `withdraw) withdraw)
                   ((eq? m `deposit) deposit)
                   (else (error "Unknown request -- MAKE-ACCOUNT" m)))
             (set! err-times 0))
      (begin (set! err-times (+ 1 err-times))
             (if (>= err-times 7) 
               call-the-cops
               0)
             "Incorrect password") ))
  dispatch)
(define acc (make-account 100 `secret-password))
((acc `secret-passwrd `withdraw) 40)
