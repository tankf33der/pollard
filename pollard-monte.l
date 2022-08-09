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
         Y (rand 1 (min A 1000000000000000000))
         C (rand 1 (min A 1000000000000000000))
         M (rand 1 (min A 1000000000000000000))
         G 1
         R 1
         Q 1 )
      (ifn (bit? 1 N)
         2
         (loop
            (NIL (=1 G))
            (setq X Y)
            (do R
               (setq Y (g Y)) )
            (zero K)
            (loop
               (NIL (and (> R K) (=1 G)))
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
               (NIL (> G 1))
               (setq
                  YS (g YS)
                  G (gcd (abs (- X YS)) N) ) ) )
         G ) ) )
(de factors (N)
   (sort
      (make
         (loop
            (setq N (/ N (link (pollard-brent N))))
            (T (isprime N)) )
         (link N) ) ) )
(let (N 838142784433443433343434303443243443434343323  L (factors N))
   (println 'L L)
   (test N (apply * L)) )
(msg 'ok)
(bye)
