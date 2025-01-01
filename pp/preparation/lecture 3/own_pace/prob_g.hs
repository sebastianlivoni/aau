
-- madras :: (t -> t -> t, t, t)-> t
madras (f,x,y) = f (f x x) y

madras_curied f x y = f (f x x) y