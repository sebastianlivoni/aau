rle [] = []
rle [x] = [(x, 1)]
rle (x : xs)
  | x == y = (x, c + 1) : zs
  | otherwise = (x, 1) : ((y, c) : zs)
  where
    ((y, c) : zs) = rle xs

-- rle :: Eq a, Num b => [a] -> [(a, b)]
rle' [] = []
rle' [x] = [(x, 1)]
rle' (x : xs) =
  let encodedTail = rle' xs
   in case encodedTail of
        ((y, c) : zs)
          | x == y -> (x, c + 1) : zs
          | otherwise -> (x, 1) : encodedTail
        [] -> [(x, 1)]