-- zipWith :: (a- > b -> c) -> [a] -> [b] -> [c]

fibonacci = 0 : 1 : zipWith (+) fibonacci (drop 1 fibonacci)