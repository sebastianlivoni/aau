-- idhead :: Eq a => [(a,a)] -> Bool
idhead [] = False
idhead ((x,y):_) = x == y

-- The function is ad-hoc polymorphic because it is limited by the typeclass Eq