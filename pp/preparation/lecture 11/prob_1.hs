fourfirst xs = do
    x <- xs
    return (4, x)


fourfirst' xs = xs >>= \x -> return (4,x)

-- fourfirst returns a list of all pairs of x's of (4,x) where x is each value in the list