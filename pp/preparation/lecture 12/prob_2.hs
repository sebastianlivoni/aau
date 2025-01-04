import Parsing

bexp =  do
        texp
        symbol "&"
        bexp
    <|>
        do
        texp
        symbol "|"
        bexp
    <|>
        do
        texp

texp =  do
        symbol "!"
        aexp
    <|>
        do
        aexp

aexp =  do
        symbol "tt"
    <|>
        do
        symbol "ff"
    <|>
        do
        symbol "("
        bexp
        symbol ")"