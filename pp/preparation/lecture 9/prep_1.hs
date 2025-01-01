main = do
    putStr "What is your name? "
    name <- getLine
    putStr "Hello "
    putStrLn name