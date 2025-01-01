class InVector a where
    (&&&) :: a -> a -> a
    (***) :: a -> a -> Int

instance InVector Bool where
    True &&& _ = True
    False &&& True = True
    False &&& False = False

    True *** False = 0
    True *** True = 1
    _ *** True = 0
    _ *** False = 0