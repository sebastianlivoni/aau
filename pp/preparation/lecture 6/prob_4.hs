fact k = product [1..k]

approx n = sum [1.0 / fromIntegral (fact x) | x <- [0..n]]