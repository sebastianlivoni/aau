-- plonk :: Num a => a -> a -> a -> a
plonk x y z = x + y + z

-- given in terms of lambda expressions from Haskell:
plonk' = \x y z -> x + y + z