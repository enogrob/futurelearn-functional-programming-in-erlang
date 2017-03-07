**Building and analysing lists**

The aim of these exercises is to familiarise you with using lists in Erlang, in particular the different way that lists can be formed and deconstructed. In the second exercise, we introduce case expressions.

Building and matching lists
In the Erlang shell try evaluating the following expressions
```Erlang
A = [1,2,4,1,3].
[2,3|A].
[97,104,97,33].
[2|[1,3|[4|[]]]].
[B|Bs] = [2,3|A].
A = tl(Bs).
[C,C|_] = [2,2,3,3,4].
C.
```

**Introducing case expressions**

In the Erlang shell try evaluating the following expressions
```erlang
case [2,3,4] of
 [X,Y|_] -> X+Y;
 [S] -> S;
 _ -> 0
end.

case [6] of
 [X,Y|_] -> X+Y;
 [S] -> S;
 _ -> 0
end.

case [] of
 [X,Y|_] -> X+Y;
 [S] -> S;
 _ -> 0
end.
```

Remember that you can use the comments on this step to discuss these exercises, which give examples of how pattern matching can be used with lists in Erlang.
