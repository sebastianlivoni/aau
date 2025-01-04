import Parsing

abs' = do ab <|> e

ab = do
    a <- char 'a'
    abs <- abs'
    b <- char 'b'
    return ([a] ++ abs ++ [b])

e = do symbol ""