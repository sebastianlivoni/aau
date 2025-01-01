letters' = do
    str <- getLine
    printCharacters str
    where
        printCharacters [] = return ()
        printCharacters (x:xs) = sequence_ [putStrLn [x], printCharacters xs]
