data Exp a = Var a | Val Integer | Add (Exp a) (Exp a) | Mult (Exp a) (Exp a) deriving (Show)

instance Functor Exp where
  -- fmap :: (a -> b) -> Exp a -> Exp b
  fmap g (Var a) = Var (g a)
  fmap g (Val a) = Val a
  fmap g (Add a b) = Add (fmap g a) (fmap g b)
  fmap g (Mult a b) = Mult (fmap g a) (fmap g b)
