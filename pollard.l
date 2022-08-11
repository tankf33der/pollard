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
         (T (isprime N 8)) )
      (link N) ) )

# FAIL ON 124, STOP SIGN
(println (pollard 124))

(msg 'ok)
(bye)
