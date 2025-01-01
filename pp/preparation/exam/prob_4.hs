newtype WrapString a = WS (a, String) deriving (Show)

instance Functor WrapString where
  fmap f (WS (x, s)) = WS (f x, s)

-- 4.1

instance Applicative WrapString where
  -- pure :: a -> WrapString a
  pure a = WS (a, "horse")

  -- (<*>) :: WrapString (a -> b) -> WrapString a -> WrapString b
  (WS (f, k1)) <*> (WS (x, k2)) = WS (f x, k1 ++ k2)

-- 4.2

instance Monad WrapString where
  return = pure

  -- (>>=) :: m a -> (a -> m b) -> m b
  -- (>>=) :: WrapString a -> (a -> WrapString b) -> WrapString b
  WS (x, _) >>= f = f x

-- 4.3

pairup x y = do
  xx <- x
  yy <- y
  return (xx, yy)