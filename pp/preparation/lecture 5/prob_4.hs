-- wrapup :: Eq a => [a] -> [[a]]
wrapup [] = []
wrapup [x] = [[x]]
wrapup (x : xs)
  | x == y = (x : y : ys) : zs
  | otherwise = [x] : (y : ys) : zs
  where
    ((y:ys):zs) = wrapup xs