data Onion a = Core a | Layer (Onion a)

instance Functor Onion where
  fmap :: (a -> b) -> Onion a -> Onion b
  fmap g (Core a) = Core (g a)
  fmap g (Layer a) = Layer (fmap g a)

onion = Layer (Layer (Layer (Layer (Layer (Layer (Core "bingo"))))))