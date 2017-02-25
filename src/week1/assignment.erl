% FutureLearn Functional Programming in Erlang
% Week1 assignment1
% Roberto Nogueira   BSd EE, MSd CE
% E-mail: enogrob@gmail.com

-module(assignment).
-export([perimeter/1, area/1, enclose/1, bits/1]).

perimeter(S) ->
  case S of
    {rectangle, L, W} ->
    2*L + 2*W;
    {square, X} ->
    4*X;
    {triangle, A, B, C} ->
    A+B+C;
    {circle, R} ->
    2*math:pi()*R
  end.

area(A) ->
  A.

enclose(A) ->
  A.

bits(V) ->
  bits(V, 0).
bits(0, C) ->
  C;
bits(V, C) ->
  bits( (V band (V - 1)), (C + 1)).
