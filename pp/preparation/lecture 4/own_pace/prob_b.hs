-- flop :: [(a,b)] -> [(b,a)]
flop xs = [(b,a) | (a,b) <- xs]