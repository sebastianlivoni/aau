import Prelude hiding (Functor, fmap)
import Prelude qualified

class Functor f where
  fmap :: (a -> b) -> f a -> f b

instance Functor ((->) r) where
  -- fmap :: (a -> b) -> (r -> a) -> r -> b
  fmap g f = \r -> g (f r)