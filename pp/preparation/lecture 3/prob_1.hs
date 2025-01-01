-- twice :: (a -> a) -> a -> a
twice f x = f(f(x)) -- The function is parametric polymorphism because it have unbounded parameters only

-- twicetwo :: ((a -> a), a) -> a
twicetwo (f,x) = f(f(x))