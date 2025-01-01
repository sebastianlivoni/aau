-- cfrac :: (RealFrac a1, Integral a2) => a1 -> Int -> [a2]
cfrac x n = take n (cfrac' x)
    where
        cfrac' x
          | x == fromIntegral (floor x) = [floor x]
          | otherwise = floor x : cfrac' (1 / (x - fromIntegral (floor x)))