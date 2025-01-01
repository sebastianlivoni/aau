-- dingo (x,y) = [x,y]

dingo :: (x,x) -> [x]
dingo (x,y) = [x,y]


twice :: (b -> b) -> b -> b

twice f x = f(f(x))


bingo :: a -> a
bingo = twice bingo
