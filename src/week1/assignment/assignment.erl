% FutureLearn Functional Programming in Erlang
% Week1 assignment1
% Roberto Nogueira   BSd EE, MSd CE
% E-mail: enogrob@gmail.com

-module(assignment).
-export([perimeter/1, area/1, enclose/1, bits/1]).

%%%-----------------------------------------------------------------
%% Define a function perimeter/1 which takes a shape and returns
%% the perimeter of the shape.
%%
%%%-----------------------------------------------------------------
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

%%%-----------------------------------------------------------------
%% Define a function area/1 which takes a shape and returns
%% the area of the shape.
%% Triangle is a right triangle.
%%%-----------------------------------------------------------------
area(S) ->
    case S of
      {rectangle, L, W} ->
      L*W;
      {square, X} ->
      X*X;
      {triangle, B, H} ->
      (B*H)/2;
      {circle, R} ->
      math:pi()*R*R
    end.

%%%--------------------------------------------------------------
%% Define a function enclose/1 that takes a shape an returns the
%% smallest enclosing rectangle of the shape.
%% Triangle is isosceles.
%%%-------------------------------------------------------------
enclose(S) ->
    case S of
      {rectangle, L, W} ->
        {rectangle,L,W};
      {triangle, A, B} ->
        H = math:sqrt((B*B)-(A*A)/4),
        {rectangle,H,B};
      {circle, R} ->
        {rectangle, R*2, R*2}
    end.

%%%--------------------------------------------------------------
%% Define a function bits/1 that takes a positive integer N and
%% returns the sum of the bits in the binary representation.
%%%--------------------------------------------------------------
bits(V) ->
  bits(V, 0).
bits(0, C) ->
  C;
bits(V, C) ->
  bits( (V band (V - 1)), (C + 1)).
