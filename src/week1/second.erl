-module(second).
-export([hypotenuse/2,perimeter/2]).

hypotenuse(A,B) ->
  math:sqrt(A*A + B*B).
perimeter(A,B) ->
  A + B + hypotenuse(A,B).
