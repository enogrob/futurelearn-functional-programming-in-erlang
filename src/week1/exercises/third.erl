-module(third).
-export([maxThree/3,howManyEqual/3]).

maxThree(A,B,C) ->
  max(max(A,B),C).

howManyEqual(A,A,A) ->
  3;
howManyEqual(A,A,B) ->
  2;
howManyEqual(A,B,A) ->
  2;
howManyEqual(A,B,B) ->
  2;
howManyEqual(_,_,_) ->
  0.
