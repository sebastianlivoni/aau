nsonly n = nsonly' 0 n
  where
    nsonly' i n = [i * n] ++ nsonly' (i + 1) n

nsonly' n = [n * i | i <- [0 ..]]