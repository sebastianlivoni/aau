import Parsing

data Onion = Core Int | Layer Onion deriving (Show)

theonion = layer <|> core

core = do Core <$> int

layer = do
    char 'L'
    Layer <$> theonion