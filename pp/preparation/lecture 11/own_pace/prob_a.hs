foldM :: Monad m => (t1 -> t2 -> m t2) -> [t1] -> t2 -> m t2

foldM _ [] acc = return acc

foldM f (x:xs) acc = do
    acc' <- f x acc
    foldM f xs acc'

dingo x = do
    putStrLn (show x)
    return x