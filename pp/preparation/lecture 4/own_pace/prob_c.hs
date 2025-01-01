-- dupli :: [a] -> [a]
dupli xs = concat ([[a,a] | a <- xs])