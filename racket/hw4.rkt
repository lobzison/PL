
#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

;; put your code below

(define (sequence low high stride)
  (if (> low high)
      null
      (cons low (sequence (+ low stride) high stride))))

(define (string-append-map xs suffix)
  (map (lambda (x) (string-append x suffix)) xs))

(define (list-nth-mod xs n)
  (if (< n 0)
      (error "list-nth-mod: negative number")
      (if (null? xs)
          (error "list-nth-mod: empty list")
          (car (list-tail xs (remainder n (length xs))))
          )))

(define (stream-for-n-steps s n)
  (if (< n 1)
      null
      (let*([val (s)])
       (cons (car val) (stream-for-n-steps (cdr val) (- n 1))))))


(define funny-number-stream
  (letrec ([f (lambda (x) (cons x (lambda () (f (
                                               if (=(remainder (+ (abs x) 1) 5) 0)
                                                  (- (- (abs x)) 1)
                                                  (+ (abs x) 1)
                                                  )))))])
    (lambda () (f 1))))

(define dan-then-dog
(letrec ([f (lambda (x) (cons x (lambda () (f (if (string=? x "dan.jpg")
                                                   "dog.jpg"
                                                   "dan.jpg")))))])
(lambda () (f "dan.jpg"))))


(define (stream-add-zero s)
(letrec ([f (lambda (x) (cons (cons 0 (car (x))) (lambda ()(f (cdr (x))))))])
(lambda () (f s))))

(define (cycle-lists xs ys)
  (letrec ([f (lambda (x) (cons (cons (list-nth-mod xs x) (list-nth-mod ys x)) (lambda () (f(+ x 1)))))])
    (lambda () (f 0))))

(define (vector-assoc v vec)
  (letrec ( [helper (lambda (n)
              (if (< n (vector-length vec))
                  (if (and (pair? (vector-ref vec n)) (equal? v (car(vector-ref vec n))))
                  (vector-ref vec n)
                  (helper (+ n 1)))
                  #f))])
    (helper 0)))

(define (cached-assoc xs n)
  (letrec ([memo (make-vector n #f)]
           [idx 0]
           [f (lambda (x)
                (let ([ans [vector-assoc x memo]])
                  (if ans
                      (cdr ans)
                      (let ([new-ans (assoc x xs)])
                        (begin
                          (vector-set! memo idx (cons x new-ans))
                          (set! idx (modulo (+ idx 1) n))
                          new-ans)))
                  ))])
    f
    ))

