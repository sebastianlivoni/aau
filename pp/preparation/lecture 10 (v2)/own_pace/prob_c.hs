data Exp a = Var a | Val Int | Add (Exp a) (Exp a) | Mult (Exp a) (Exp a) deriving (Show)

instance Functor Exp where
  -- fmap :: (a -> b) -> Exp a -> Exp b
  fmap g (Var a) = Var (g a)
  fmap g (Val a) = Val a
  fmap g (Add a b) = Add (fmap g a) (fmap g b)
  fmap g (Mult a b) = Mult (fmap g a) (fmap g b)

instance Applicative Exp where
  pure a = Var a

  -- (<*>) :: Exp (a -> b) -> Exp a -> Exp b
  (Var f) <*> x = fmap f x
  (Val _) <*> _ = Val 0
  _ <*> (Val _) = Val 0
  (Add fa fb) <*> x = Add (fa <*> x) (fb <*> x)
  (Mult fa fb) <*> x = Mult (fa <*> x) (fb <*> x)

type Name = String

type Env = [(Name, Int)]

fetch :: Name -> Env -> Int
fetch x env = case lookup x env of
  Nothing -> error "invalid name"
  Just v -> v

-- eval :: Exp -> Env -> Int
eval (Var a) env = fetch a env
eval (Val a) _ = a
eval (Add a b) env = eval a env + eval b env
eval (Mult a b) env = eval a env * eval b env

example = eval (Mult (Add (Var "a") (Var "b")) (Val 5)) [("a", 1), ("b", 2)]