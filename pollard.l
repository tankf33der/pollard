(load "isprime.l")
(de gcd (A B)
   (until (=0 B)
      (let M (% A B)
         (setq A B B M) ) )
   (abs A) )
(de g (X)
   (% (inc (* X X)) N) )
# Pollard Rho, wikipedia
(de pollard (N)
   (let (X 2  Y 2  D 1)
      (while (=1 D)
         (setq
            X (g X)
            Y (g (g Y))
            D (gcd (abs (- X Y)) N) ) )
      (if (== D N) NIL D) ) )
(de factors (N)
   (make
      (loop
         (setq N (/ N (link (pollard N))))
         (T (isprime N)) )
      (link N) ) )
(test (101 103) (factors 10403))
(test
   (3 341 131 2731 8191 409891 7623851 145295143558111)
   (factors 1361129467683753853853498429727072845823) )
(test (127 9721) (factors 1234567))
(test (3 3 239 4649) (factors 9999999))

(msg 'ok)
(bye)
