letters = do
    str <- getLine
    printCharacters str
    where
        printCharacters [] = return ()
        printCharacters (x:xs) = do
            putStrLn [x]
            printCharacters xs
