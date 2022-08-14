(load "pollard-monte.l")
(seed (in "/dev/urandom" (rd 8)))
(de r (B)
<<<<<<< HEAD
   (in "/dev/urandom" (rd B)) )
(do 10
   (at (0 . 10) (prin ".") (flush))
=======
   (max 2 (in "/dev/urandom" (rd B))) )
(do 100000
   (at (0 . 10000) (prin ".") (flush))
>>>>>>> 86f67bd898c1d6be2d8ca0933f83eb1e372d7b1e
   (let
      (N (r (rand 1 7))
         A (factors N)
         C (list 'factor N)
         B
         (make
            (in C
               (from ": ")
               (until (eol)
                  (link (format (till " \n")))



                  (from " ") ) ) ) )
      (println 'B B 'C C)
      (test A B) ) )
(msg 'ok)
(bye)
