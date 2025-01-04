import Prelude hiding (Applicative, (<*>))

class (Functor f) => Applicative f where
  pure :: a -> f a
  (<*>) :: f (a -> b) -> f a -> f b

instance Applicative [] where
  -- fmap :: (a -> b) -> [a] -> [b]

  pure x = [x]

  -- gs <*> xs = [g x | g <- gs, x <- xs]
  [] <*> _ = []
  _ <*> [] = []
  (g : gs) <*> xs = fmap g xs ++ gs <*> xs