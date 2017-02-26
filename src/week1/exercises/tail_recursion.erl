-module(tail_recursion).
-export([fib/1,fac/1, loop/1, sum/1, max/1, perfect/1]).


fib(N) ->
  fib(N,0,1).

fib(0,P,_C) ->
  P;
fib(N,P,C) ->
  fib(N-1,C,P+C).


fac(N) ->
  fac(N,1).

fac(0,P) ->
  P;
fac(N,P) when N>0 ->
  fac(N-1,P*N).


loop(N) when N> 0 ->
  io:format("~p~n", [N]),
  loop(N-1);

loop(0) ->
  io:format("bye~n").


sum(N) ->
  sum(N, 0).

sum(0, ACC) ->
  ACC;
sum(N, ACC) when N > 0 ->
  sum(N-1, ACC + N).


max(N) ->
  max(N,rand:uniform(),0).

max(0,_ACC,MAX) ->
  MAX;
max(N,ACC,MAX) when ACC > MAX ->
  io:format("ACC ~p~n", [ACC]),
  io:format("MAX ~p~n", [MAX]),
  max(N-1,rand:uniform(), ACC);
max(N,ACC,MAX) when ACC < MAX ->
  io:format("ACC ~p~n", [ACC]),
  io:format("MAX ~p~n", [MAX]),
  max(N-1,rand:uniform(), MAX).


perfect(N) ->
  perfect(N,1,0).

perfect(N,N,S) ->
  N==S;
perfect(N,M,S) when N rem M == 0 ->
  perfect(N, M+1,S+M);
perfect(N,M,S) ->
  perfect(N,M+1,S).
