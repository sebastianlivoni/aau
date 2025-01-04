import Parsing

data Bexp = T | F | Or Bexp Bexp | And Bexp Bexp | Not Bexp deriving (Show)

bexp =
  do
    t <- texp
    symbol "&"
    b <- bexp
    return (And t b)
    <|> do
      t <- texp
      symbol "|"
      b <- bexp
      return (Or t b)
    <|> do
      t <- texp
      return t

texp =
  do
    symbol "!"
    a <- aexp
    return (Not a)
    <|> do
      a <- aexp
      return a

aexp =
  do
    symbol "tt"
    return T
    <|> do
      symbol "ff"
      return F
    <|> do
      symbol "("
      b <- bexp
      symbol ")"
      return b