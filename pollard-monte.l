(load "isprime.l")
(de gcd (A B)
   (until (=0 B)
      (let M (% A B)
         (setq A B B M) ) )
   (abs A) )
(de g (A)
   (% (+ (% (* A A) N) C) N) )
(de pollard-brent (N)
   (cond
      ((not (bit? 1 N)) 2)
      ((isprime N) N)
      (T
         (let
            (A (dec N)
               Y (longRand 1 A)
               C (longRand 1 A)
               M (longRand 1 A)
               G 1
               R 1
               Q 1 )
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
            G ) ) ) )
(de factors (N)
   (sort
      (make
         (let P NIL
            (loop
               (until (isprime (setq P (pollard-brent N))))
               (link P)
               (setq N (/ N P))
               (NIL (> N 1)) ) ) ) ) )
