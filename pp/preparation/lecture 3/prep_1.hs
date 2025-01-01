quango :: a -> [a]
quango a = [a]

-- quango have parametric polymorphism because is unconstrained and does need to know anything about its type to work

tango :: Num p1 => (a,b) -> p2 -> p1
tango _ _ = 42

-- Tango is both parametric and ad hoc polymorphic.
-- ad hoc polymorphic due to the bounded type p1
-- parametric  polymorphic due to unconstrained a, b and p2

