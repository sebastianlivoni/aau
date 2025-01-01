data Exp a = Var a | Val Integer | Add (Exp a) (Exp a) | Mult (Exp a) (Exp a) deriving (Show)

instance Functor Exp where
  -- fmap :: (a -> b) -> Exp a -> Exp b
  fmap f (Var a) = Var (f a)
  fmap f (Val i) = Val i
  fmap f (Add ex1 ex2) = Add (fmap f ex1) (fmap f ex2)
  fmap f (Mult ex1 ex2) = Mult (fmap f ex1) (fmap f ex2)

-- It would be a good idea to fmap when you want to change variables names.

expr = Add (Var "x") (Mult (Val 3) (Var "z"))

renameVariable oldVar = if oldVar == "x" then "y" else oldVar

renamedExpr = fmap renameVariable expr