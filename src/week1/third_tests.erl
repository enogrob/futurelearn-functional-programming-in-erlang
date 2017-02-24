% To run tests:
% erl -make
% erl -noshell -eval "eunit:test(leap, [verbose])" -s init stop
%

-module(third_tests).

-include_lib("eunit/include/eunit.hrl").

maxThree_test() ->
  ?assertEqual(3, third:maxThree(1,2,3)).

howManyEqual0_test() ->
  ?assertEqual(0, third:howManyEqual(1,2,3)).

howManyEqual1_test() ->
  ?assertEqual(2, third:howManyEqual(1,1,3)).

howManyEqual2_test() ->
  ?assertEqual(3, third:howManyEqual(1,1,1)).
