-- dingo :: (a,a) -> [a]
dingo (x,y) = [x,y]

-- the type of dingo is (a,a) -> [a] due to a list can only contain the same type and therefore we know it

-- dingo is parametric polymorphism on both x and y