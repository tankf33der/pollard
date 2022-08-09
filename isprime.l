(de longRand (A B)
   (max
      A
      (% (in "/dev/urandom" (rd (size B))) B) ) )
(de **Mod (X Y N)
   (let M 1
      (loop
         (when (bit? 1 Y)
            (setq M (% (* M X) N)) )
         (T (=0 (setq Y (>> 1 Y))) M)
         (setq X (% (* X X) N)) ) ) )
(de isprime (N P)
   (default P 16)
   (or
      (== N 2)
      (and
         (> N 1)
         (bit? 1 N)
         (let (Q (dec N)  N1 (dec N)  K 0  X)
            (until (bit? 1 Q)
               (setq Q (>> 1 Q)  K (inc K)) )
            (do P
               (setq X
                  (**Mod (longRand 2 N1) Q N) )
               (NIL
                  (or
                     (=1 X)
                     (= X N1)
                     (do K
                        (setq X (**Mod X 2 N))
                        (T (= X N1) T) ) ) )
               T ) ) ) ) )
