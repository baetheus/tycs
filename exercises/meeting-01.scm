;;; 1.1 - What are the outputs of the following expressions?

10
; Expected: 10

(+ 5 3 4)
; Expected: 12

(- 9 1)
; Expected: 8

(/ 6 2)
; Expected: 3

(+ (* 2 4) (- 4 6))
; Expected: 6

(define a 3)
; Expected: a

(define b (+ a 1))
; Expected: b

(+ a b (* a b))
; Expected: 19

(= a b)
; Expected: false

(if (and (> b a) (< b (* a b)))
    b
    a)
; Expected: 4

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
; Expected: 16

(+ 2 (if (> b a) b a))
; Expected: 6

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
; Expected: 16


;;; 1.2 Translate Equation
(/ (+ 5
      4 
      (- 2 
         (- 3 
            (+ 6 
               (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))


;;; 1.3
(define (square x) (* x x))

(define (min x y) (if (> x y) y x))

(define (sum-squares-of-max x y z) 
        (- (+ (square x)
              (square y)
              (square z))
           (square (min x (min y z)))))

;; Test Cases - Expected: 13
(sum-squares-of-max 1 2 3)
(sum-squares-of-max 1 3 2)
(sum-squares-of-max 2 1 3)
(sum-squares-of-max 2 3 1)
(sum-squares-of-max 3 1 2)
(sum-squares-of-max 3 2 1)


;;; 1.4
(define (a-plus-abs-b a b)
        ((if (> b 0) + -) a b))

; (a-plus-abs-b 1 2)
; ((if (> 2 0) + -) 1 2)
; ((if true + -) 1 2)
; (+ 1 2)
; 3
; If b is positive, add it to a, otherwise subtrace it (effectively add absolute value of b)


;;; 1.5
(define (p) (p))

(define (test x y)
        (if (= x 0)
            0
            y))

; (test 0 (p))

; Applicative Order (Substitution)
; (test 0 (p))
; (test 0 (p))
; (test 0 (p))
; (test 0 (p))
;
; Applicative Order immediately enters an infinite loop

; Normal Order
; (test 0 (p))
; (if (= 0 0) 0 (p))
; (if true 0 (p))
; 0
;
; Normal Order resolves to the value of 0 as (p) does not evaluate


;;; 1.6
; Because scheme uses substitution (applicative order) the else-clause in new-if gets
; evaluated regardless of the value that predicate reduces to, since the else clause
; in square-iter is square-iter, this causes an infinite loop.


;;; 1.7
; Just use Newton's Method, 

(define (sqrt-iter guess x)
        (if (good-enough? guess x)
            guess
            (sqrt-iter (improve guess x)
                       x)))

(define (good-enough? guess x)
        (< (abs (- (improve guess x) guess))
           (abs (* guess 0.001))))

(define (improve guess x)
        (- guess
           (/ (square guess) (square x))))


(define (sqrt x)
        (sqrt-iter 1.0 x))

;;; 1.8
