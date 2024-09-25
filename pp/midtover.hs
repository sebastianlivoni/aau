midtover xs = (take (middle) xs, drop (middle) xs) where middle = length xs `div` 2

midtover' xs = splitAt (length xs `div` 2) xs
