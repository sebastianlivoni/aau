data Exp a = Var a | Val Integer | Add (Exp a) (Exp a) | Mult (Exp a) (Exp a) deriving (Show)

instance Functor Exp where
  -- fmap :: (a -> b) -> Exp a -> Exp b
  fmap f (Var a) = Var (f a)
  fmap f (Val i) = Val i
  fmap f (Add ex1 ex2) = Add (fmap f ex1) (fmap f ex2)
  fmap f (Mult ex1 ex2) = Mult (fmap f ex1) (fmap f ex2)

instance Applicative Exp where
  -- pure :: a -> Exp a
  pure a = Var a

  -- (<*>) :: Exp (a -> b) -> Exp a -> Exp b
  (Var f) <*> (Var g) = Var (f g)
  (Val k) <*> _ = Val k
  _ <*> (Val k) = Val k
  (Add ex1 ex2) <*> ex = Add (ex1 <*> ex) (ex2 <*> ex)
  (Mult ex1 ex2) <*> ex = Mult (ex1 <*> ex) (ex2 <*> ex)
