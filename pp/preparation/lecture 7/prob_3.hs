-- data Encyclopedia a =
--    Leaf String a
--    | Node1 String a ( Encyclopedia a )
--    | Node2 String a ( Encyclopedia a ) ( Encyclopedia a )
--    | Node3 String a ( Encyclopedia a ) ( Encyclopedia a ) ( Encyclopedia a ) deriving Show

data Encyclopedia a = Leaf String a | Node String a [Encyclopedia a] deriving Show

t1 = (Node "mango" True [(Node "dingo" False [(Leaf "plip" True), (Leaf "ninka" False)]), (Leaf "plop" True), (Node "plys" False [(Leaf "boring" True)])])

t2 = (Node "plonk" 1 [(Node "zap" 3 [(Leaf "ninka" 8)]), (Node "uhu" 4 [(Leaf "gif" 9)]), (Leaf "bingo" 5)])