data Expr = Val Int | Add Expr Expr

k = (Add (Add (Val 2) (Val 3)) (Val 4))

foldexp :: (Int -> a) -> (a -> a -> a) -> Expr -> a
foldexp f g (Val n) = f n
foldexp f g (Add x y) = g (foldexp f g x) (foldexp f g y)

eval :: Expr -> Int
eval expr = foldexp f g expr
    where
        f n = n
        g x y = x + y