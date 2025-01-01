(λx.xx)(λx.xx)

we replace the second one with y because "In order not to complicate the semantics and the notion of substitution, we always assume that all binding occurrences use diﬀerent variable names."

(λx.xx)(λy.yy)

(λx.xx)(λy.yy) => (λy.yy)(λy.yy) => (λy.yy)(λy.yy) => ...

this will continue forever as it is recursive
