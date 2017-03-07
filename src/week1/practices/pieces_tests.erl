% To run tests:
% erl -make
% erl -noshell -eval "eunit:test(leap, [verbose])" -s init stop
%

-module(pieces_tests).

-include_lib("eunit/include/eunit.hrl").

pieces0_test() ->
  ?assertEqual(1, pieces:piece(0)).

pieces1_test() ->
  ?assertEqual(2, pieces:piece(1)).

pieces2_test() ->
  ?assertEqual(4, pieces:piece(2)).

pieces3_test() ->
  ?assertEqual(7, pieces:piece(3)).

pieces4_test() ->
  ?assertEqual(11, pieces:piece(4)).

pieces5_test() ->
  ?assertEqual(16, pieces:piece(5)).

pieces6_test() ->
  ?assertEqual(22, pieces:piece(6)).

pieces7_test() ->
  ?assertEqual(29, fibonacci:fib(7)).
