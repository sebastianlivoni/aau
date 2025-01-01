data W x = Bingo x deriving Show

instance Functor W where
    fmap f (Bingo x) = Bingo (f x)

instance Applicative W where
    pure = Bingo

    -- (<*>) :: W (a -> b) -> W a -> W b
    (<*>) :: W (a -> b) -> W a -> W b
    Bingo g <*> Bingo x = Bingo (g x)

instance Monad W where
    return = pure
    Bingo x >>= f = f x

wrapadd x y = do
    r1 <- x
    r2 <- y
    return (r1 + r2)

wrapadd' x y = x >>= \r1 -> y >>= \r2 -> return (r1 + r2)

wrapadd'' x y = (+) <$> x <*> y