;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname hw12) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;Jing Lin
;ML1-05
;HW#12

(define Check (lambda (a) (if (integer? (sqrt a)) a 0)))
;Check is a function that takes a numerical input and returns the number 
;if the number is a perfect square and returns 0 otherwise. This is a helper
;function to SumPerfSqs. 
(Check 4) "...should be 4"
(Check 3) "...should be 0"
(Check 5) "...should be 0"

(define SumPerfSqs 
  (lambda (a b) 
    (if
      (= a b) (Check a) 
      (+ (Check (max a b)) (SumPerfSqs (- (max a b) 1) (min a b)))))) 
      
;SumPerfSqs is a function whose form is a cond statement. It takes two numerical inputs 
;and finds the sum of the all the perfect squares between them and including them. If the
;two numerical inputs are the same, then it determines if one of them is a perfect square and 
;spits out that number if it is, 0 otherwise. 
(SumPerfSqs 1 9) "...should be 14"
(SumPerfSqs 1 4) "...should be 5"
(SumPerfSqs 2 4) "...should be 4"
