**Constructing lists with recursive functions**

The aim of these exercises is to familiarise you with other ways of defining functions over lists in Erlang, in particular the different way that recursive functions can construct lists.

**Transforming list elements**

Define an Erlang function `double/1` to double the elements of a list of numbers.
```erlang
-module(practice2).
export([double/1]).


double([]) ->
    [];
double([X | Xs]) ->
    [X | X | double(Xs)].
```

**Filtering lists**

Define a function `evens/1` that extracts the even numbers from a list of integers.
```erlang
module(practice2).
export([evens/1]).


evens([]) ->
    [];
evens([X | Xs]) when X rem 2 == 0 ->
    [X | evens(Xs)];
evens([_X | Xs]) ->
    evens(Xs).
```

**Going further**

If you want to try some other recursions on lists try to define functions to give:

* `the median` of a list of numbers: this is the middle element when the list is ordered (if the list is of even length you should average the middle two)

* `the modes` of a list of numbers: this is a list consisting of the numbers that occur most frequently in the list; if there is is just one, this will be a list with one element only

* In doing this you might find it useful to think of other functions that you could define to help you solve these problems, such as a function to sort a list, or to work out how many times a value occurs in a particular list.

Once you have written your solutions, particularly for the latter questions, you might like to discuss your approach to solving the problems with other participants using the comments on this step.
```erlang
module(practice2).
export([median/1, mode/1]).


median(Xs) when length(Xs) rem 2 == 1 ->
   median(Xs, 1, (length(Xs) div 2) + 1);
median(Xs) ->
   (median(Xs, 1, (length(Xs) div 2) + 1) + median(Xs, 1, length(Xs) div 2)) div 2.

median([X | _Xs], CURR, FIND) when CURR == FIND ->
    X;
median([_X | Xs], CURR, FIND) ->
    median(Xs, CURR + 1, FIND).


mode([]) ->
    [];
mode(Xs) ->
    PAIR = groupEl(Xs, []),
    MAX = findMaxOccur(PAIR, 0),
    filter(PAIR, [], MAX).


groupEl([], ACCUM) ->
    ACCUM;
groupEl([X | Xs], ACCUM) ->
    groupEl(Xs, updateTuple(ACCUM, X)).


updateTuple([], Num) ->
    [{Num, 1}];
updateTuple([X | Xs], Num) ->
    case X of
        {Num, Count} -> [{Num, Count + 1} | Xs];
        _ -> [X | updateTuple(Xs, Num)]
    end.


findMaxOccur([], MaxOccur) ->
    MaxOccur;
findMaxOccur([{_, Occur} | Xs], MaxOccur) ->
    case Occur > MaxOccur of
        true -> findMaxOccur(Xs, Occur);
        _ -> findMaxOccur(Xs, MaxOccur)
    end.
```
