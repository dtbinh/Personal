;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |nD sD sOD sM aA2B sM|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(define numDigits 
  (lambda (n)    
  (if (= (quotient n 10) 0)
      1
      (+ 1 (numDigits (quotient n 10))))))
(numDigits 3)
(numDigits 501)
(numDigits 20)

(define sumDigits 
  (lambda (n)    
    (if (= (quotient n 10) 0)
        n
        (+ (remainder n 10)
           (sumDigits (quotient n 10))))))

(define sumOddDigits 
  (lambda (n) 
    (cond ((= n 0) 0) ;equiv to (and (odd? n) (< n 10)) n)
          ((odd? n) (+ (remainder n 10) 
                       (sumOddDigits (quotient n 10))))
          (else (sumOddDigits (quotient n 10))))))

(define sumAtoB 
  (lambda (a b)
  (if (= a b)
      a
      (+ a (sumAtoB (+ 1 a) b)))))

(define sumMultiples
  (lambda (m n)
    (if (= (remainder n m) 0)
        (if (= m n)
            n
            (+ n (sumMultiples m (- n m))))
        (sumMultiples m (* (quotient n m) m)))))