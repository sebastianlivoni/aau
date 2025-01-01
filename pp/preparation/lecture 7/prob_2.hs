data Aexp = Numeral Integer | Variable String | Add Aexp Aexp | Mult Aexp Aexp

eval (Numeral a) _ = a
eval (Variable a) ass = ass a
eval (Add e1 e2) ass = eval e1 ass + eval e2 ass
eval (Mult e1 e2) ass = eval e1 ass * eval e2 ass

test = eval (Add (Numeral 1) (Variable "A")) ass
    where
        ass "A" = 2
        ass "B" = 3
        ass "C" = 4