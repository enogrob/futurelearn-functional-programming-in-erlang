-module(tail_recursion_tests).
-include_lib("eunit/include/eunit.hrl").
fib0_test() ->
  ?assertEqual(0, tail_recursion:fib(0)).

fib1_test() ->
  ?assertEqual(1, tail_recursion:fib(1)).

fib2_test() ->
  ?assertEqual(1, tail_recursion:fib(2)).

fib3_test() ->
  ?assertEqual(2, tail_recursion:fib(3)).

fib4_test() ->
  ?assertEqual(3, tail_recursion:fib(4)).

fib5_test() ->
  ?assertEqual(5, tail_recursion:fib(5)).

fac3_test() ->
  ?assertEqual(6, tail_recursion:fac(3)).

fac4_test() ->
  ?assertEqual(24, tail_recursion:fac(4)).

sum4_test() ->
  ?assertEqual(10, tail_recursion:sum(4)).

sum5_test() ->
  ?assertEqual(15, tail_recursion:sum(5)).

perfect5_test() ->
  ?assertNot(tail_recursion:perfect(5)).

perfect28_test() ->
  ?assert(tail_recursion:perfect(28)).
