;; The first three lines of this file were inserted by DrScheme. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname sumPerfSqs) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;Kevin Wong
;ML1-5
;HW12
(define sumPerfSqs ;sumPerfSqs takes two positive numerical inputs and returns the sum of all perfect squares between a and b inclusive
  (lambda (a b)
    (if (and (= a b) (not (integer? (sqrt a))))
        0
        (if (and (= a b) (integer? (sqrt a )))
            a
            (if (< a b)
                (if (integer? (sqrt a))
                    (+ a (sumPerfSqs (+ a 1) b))
                    (sumPerfSqs (+ a 1) b))
                (if (integer? (sqrt a))
                    (+ a (sumPerfSqs (- a 1) b))
                    (sumPerfSqs (- a 1) b)))))))
(sumPerfSqs 2 5) "...should be 4"
(sumPerfSqs 2 10) "...should be 13"
(sumPerfSqs 1 1) "...should be 1"