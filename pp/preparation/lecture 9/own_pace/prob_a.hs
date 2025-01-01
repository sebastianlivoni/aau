sumInts = do
    input <- getLine
    let acc = read input :: Int
    sum <- loop acc
    putStrLn $ "The sum is " ++ show sum
  where
    loop acc = do
        val <- getLine
        if val == "0"
            then return acc
            else do
                let x = read val :: Int
                loop (acc + x)
