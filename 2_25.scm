((lambda (x) (cdaddr x)) (list 1 3 (list 5 7) 9))  
((lambda (x) (car x)) (list (list 7)))  
((lambda (x) (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr x)))))))))))) (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))   
