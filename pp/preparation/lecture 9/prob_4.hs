hugorm = do
    putStr "How many numbers would you like to add? "
    input <- getLine
    let n = read input :: Int
    sum <- loop n 0
    putStrLn $ "The sum is " ++ (show sum)
    where
        loop 0 acc = return acc
        loop count acc = do
            val <- getLine
            let x = read val :: Int
            loop (count - 1) (acc + x)
