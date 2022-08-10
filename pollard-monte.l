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
         (let P NIL
            (loop
               (until (isprime (setq P (pollard-brent N))))
               (link P)
               (setq N (/ N P))
               (NIL (> N 1)) ) ) ) ) )
(loop
   (println 'loop)
   (test (3 41) (factors 123))
   (test (2 2 31) (factors 124))
   (test (5 5 5) (factors 125))
   (test (127) (factors 127))
   (test (2 2 2 2 2 2 2) (factors 128))
   (test (3 43) (factors 129))
   (test (2 5 13) (factors 130))
   (test (131) (factors 131))
   (test (19 22605091) (factors 429496729))
   (test (2 23 9941 93923) (factors 42949672978))
   (test (7 277 21419 103414839323) (factors 4294967297867654443))
   (factors 184467440737095516151)

)

(msg 'ok)
(bye)
