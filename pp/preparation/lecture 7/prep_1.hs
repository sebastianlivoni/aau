data Unary = I Unary | Z

-- unary2int :: Unary -> Integer
unary2int Z = 0
unary2int (I a) = 1 + unary2int a

-- unary2int (I (I (I (I Z)))) = 4