import Prelude hiding (Applicative, (<*>))
import qualified Prelude

class Functor f => Applicative f where
    pure :: a-> f a
    (<*>) :: f (a -> b) -> f a -> f b

instance Applicative [] where
  -- pure :: a -> [a]
  pure x = [x]

  -- (<*>) :: [a -> b] -> [a] -> [b]
  [] <*> _ = []
  (f:fs) <*> xs = fmap f xs ++ fs <*> xs

  -- existing:
  -- gs <*> xs = [g x | g <- gs, x <- xs]