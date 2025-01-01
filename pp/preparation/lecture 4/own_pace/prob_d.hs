sums m n = [ x+y | x <- [1..m], y <- [1..n]]

sums' m n = concat [[x + y | y <- [1..n]] | x <- [1..m]]