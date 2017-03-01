% To run tests:
% erl -make
% erl -noshell -eval "eunit:test(leap, [verbose])" -s init stop
%

-module(practice2_tests).

-include_lib("eunit/include/eunit.hrl").

double_test() ->
  ?assertEqual([2,4,6,8], practice2:double_test([1,2,3,4])).

evens_test() ->
  ?assertEqual([2,4], practice2:evens([1,2,3,4])).

median_test() ->
  ?assertEqual(2, practice2:median([1,2,3,4])).

modes_test() ->
  ?assertEqual(2, practice2:modes([1,2,3,4,2])).
