% To run tests:
% erl -make
% erl -noshell -eval "eunit:test(leap, [verbose])" -s init stop
%

-module(fibonacci_tests).

-include_lib("eunit/include/eunit.hrl").

fib0_test() ->
  ?assertEqual(0, fibonacci:fib(0)).

fib1_test() ->
  ?assertEqual(1, fibonacci:fib(1)).

fib2_test() ->
  ?assertEqual(1, fibonacci:fib(2)).

fib3_test() ->
  ?assertEqual(2, fibonacci:fib(3)).

fib4_test() ->
  ?assertEqual(3, fibonacci:fib(4)).

fib5_test() ->
  ?assertEqual(5, fibonacci:fib(5)).

fib6_test() ->
  ?assertEqual(8, fibonacci:fib(6)).

fib7_test() ->
  ?assertEqual(13, fibonacci:fib(7)).
