(load "isprime.l")
(de gcd (A B)
   (until (=0 B)
      (let M (% A B)
         (setq A B B M) ) )
   (abs A) )
(de g (X)
   (% (inc (* X X)) N) )
(de pollard-gcd (N)
   (let (X 2  Y 2  D 1  Z 1)
      (catch 'break
         (loop
            (setq
               X (g X)
               Y (g (g Y))
               D (abs (- X Y))
               Z (% (* Z D) N) )
            (at
               (0 . 100)
               (setq D (gcd Z N))
               (if (<> D 1)
                  (throw 'break)
                  (one Z) ) ) ) )
      (if (== D N) 0 D) ) )

# FAIL ON 124, STOP
(println (pollard-gcd 124))

(msg 'ok)
(bye)
