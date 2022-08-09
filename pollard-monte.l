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
         (if (== G N)
            NIL
            G ) ) ) )
(de factors (N)
   (sort
      (make
         (loop
            (setq N (/ N (link (pollard-brent N))))
            (T (isprime N)) )
         (link N) ) ) )
(println (factors 10403))
(println
   (factors 1361129467683753853853498429727072845823) )
(println (factors 1234567))
(println (factors 9999999))
# (bench (println (factors 340282366920938463463374607431768211457)))
# (bench (println (factors 115792089237316195423570985008687907853269984665640564039457584007913129639937)))
# (bench (println (factors 13407807929942597099574024998205846127479365820592393377723561443721764030073546976801874298166903427690031858186486050853753882811946569946433649006084097)))

(msg 'ok)
(bye)
