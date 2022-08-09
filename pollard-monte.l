(load "isprime.l")
(de gcd (A B)
   (until (=0 B)
      (let M (% A B)
         (setq A B B M) ) )
   (abs A) )
(de g (A)
   (% (+ (% (* A A) N) C) N) )
(de pollard-brent (N)
   (let
      (A (dec N)
         Y (longRand 1 A)
         C (longRand 1 A)
         M (longRand 1 A)
         G 1
         R 1
         Q 1 )
      (ifn (bit? 1 N)
         2
         (while (=1 G)
            (setq X Y)
            (do R
               (setq Y (g Y)) )
            (zero K)
            (while (and (> R K) (=1 G))
               (setq YS Y)
               (do (min M (- R K))
                  (setq
                     Y (g Y)
                     Q (% (* Q (abs (- X Y))) N) ) )
               (setq
                  G (gcd Q N)
                  K (+ K M) ) )
            (setq R (* R 2)) )
         (when (== G N)
            (loop
               (NIL (> 1 G))
               (setq
                  YS (g YS)
                  G (gcd (abs (- X YS)) N) ) ) )
         G ) ) )
(de factors (N)
   (sort
      (make
         (loop
            (setq N (/ N (link (pollard-brent N))))
            (T (or (=1 N)(isprime N 8))) )
         (link N) ) ) )
# (let (N 838142784433443433343434303443243443434343323243432 L (factors N))
   # (test N (apply * L)) )


(println (pollard-brent 47))
(println (isprime 47))

(msg 'ok)
(bye)
