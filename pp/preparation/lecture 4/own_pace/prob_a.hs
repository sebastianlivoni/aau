-- sevens :: Integral a => a -> [a]
sevens k = [x | x <- [1..k], x `mod` 7 == 0]