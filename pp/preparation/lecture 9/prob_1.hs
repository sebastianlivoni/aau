main :: IO ()
main = do
    w <- getLine
    loop (read w :: Int)

loop :: Int -> IO ()
loop 1 = putStr (show 1)
loop x = do
    putStr (show x)
    putStr " "
    if even x
        then loop (x `div` 2)
        else loop (3 * x + 1)
