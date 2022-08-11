(load "pollard-monte.l")
(seed (in "/dev/urandom" (rd 8)))
(de r (B)
   (in "/dev/urandom" (rd B)) )
(do 1000000
   (at (0 . 10000) (prin ".") (flush))
   (let
      (N (r (rand 1 7))
         A (factors N)
         C (list 'factor N)
         B
         (make
            (in C
               (read)
               (until (eol) (link (read))) ) ) )
      (test A B) ) )
(msg 'ok)
(bye)
