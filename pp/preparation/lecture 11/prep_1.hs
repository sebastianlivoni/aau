tuple :: (Monad m) => m a -> m b -> m (a, b)
-- tuple x y = a >>= b >>=

tuple x y = x >>= \a -> y >>= \b -> return (a, b)

tuple' :: (Monad m) => m a -> m b -> m (a, b)
tuple' x y = do
  x_ <- x
  y_ <- y
  return (x_, y_)

-- What does the function do in the case, where the monad is Maybe?

-- The function will only return the tuple if both x and y is Just otherwise it will return Nothing