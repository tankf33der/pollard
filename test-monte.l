(load "pollard-monte.l")
(seed (in "/dev/urandom" (rd 8)))
(de r (B)
   (in "/dev/urandom" (rd B)) )
(do 10
   (at (0 . 10) (prin ".") (flush))
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
