sumInts' = do
  sum <- whileIO getIO condF foldF 0
  putStrLn $ "The sum is " ++ show sum
  where
    getIO = do
      input <- getLine
      return input

    condF x = x == "0"

    foldF x acc = acc + (read x :: Int)

    original = 0

whileIO getIO condF foldF original = do
  input <- getIO
  if condF input
    then return original
    else do
      let x = read input :: Int
      let updatedAcc = foldF input original
      whileIO getIO condF foldF updatedAcc