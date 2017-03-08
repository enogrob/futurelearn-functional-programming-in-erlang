-module(practice1).
-export([doubleAll/1, evens/1, product/1, zip/2, zip_with/3, zip_with2/3, zip2/2]).
-import(lists,[map/2, filter/2, foldr/3]).

% Define the functions doubleAll, evens, and product using the higher-order
% functions from lists module e.g. map/2, filter/2 and foldr/3.
doubleAll(X) ->
  F = fun(Y) -> Y*2 end,
  map(F, X).

evens(X) ->
  F = fun(Y) -> Y rem 2 == 0 end,
  filter(F, X).

product(X) ->
  F = fun(Y, AccIn) -> Y * AccIn end,
  foldr(F, 1, X).

% Define a function zip/2 that “zips together” pairs of elements from two
% lists like this:
% zip([1,3,5,7], [2,4]) = [ {1,2}, {3,4} ]
zip([],_) ->
  [];
zip(_,[]) ->
  [];
zip([X|Xs], [Y|Ys]) ->
  [{X,Y} | zip(Xs, Ys)].

% Define a function zip_with/3 that “zips together” pairs of elements from two
% lists using the function in the first argument, like this:
% zip_with(fun(X,Y) -> X+Y end, [1,3,5,7], [2,4]) = [ 3, 7 ]
zip_with(_F, [],_) ->
  [];
zip_with(_F, _,[]) ->
  [];
zip_with(F, [X|Xs], [Y|Ys]) ->
  [F(X,Y) | zip_with(F, Xs, Ys)].

% Re-define the function zip_with/3 using zip and lists:map.
zip_with2(F, Xs, Ys) ->
    lists:map(fun({X, Y}) -> F(X, Y) end, zip(Xs, Ys)).

% Re-define zip/2 using zip_with/3.
zip2(Xs, Ys) ->
    zip_with(fun(X, Y) -> {X, Y} end, Xs, Ys).
