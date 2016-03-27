;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname hw12) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;Stephanie Stettner
;ML1-5
;HW12

;sumPerfSqs adds all the perfect squares between and including a and b

(define sumPerfSqs (lambda (a b)
                     (cond ((< a b)
                             (if (integer? (sqrt a))
                                 (+ a (sumPerfSqs (+ a 1) b))
                                 (sumPerfSqs (+ a 1) b)))
                            ((< b a) 
                             (if (integer? (sqrt b))
                                 (+ b (sumPerfSqs a (+ b 1)))
                                 (sumPerfSqs a (+ b 1))))
                            ((= a b)
                              (if (integer? (sqrt a))
                                  a
                                  0))
                             )))



(sumPerfSqs 10 2) "...should be 13"
(sumPerfSqs 2 3) "...should be 0"
(sumPerfSqs 1 1) "...should be 1"
(sumPerfSqs 2 5) "...should be 4"
(sumPerfSqs 2 10) "...should be 13"