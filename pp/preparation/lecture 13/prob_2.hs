fib 0 = 0
fib 1 = 1
fib x = last (take x (fibsfrom 1 1))

fibsfrom n1 n2 = n1 : fibsfrom n2 (n1 + n2)