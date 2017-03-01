% To run tests:
% erl -make
% erl -noshell -eval "eunit:test(leap, [verbose])" -s init stop
%

-module(practice2_tests).

-include_lib("eunit/include/eunit.hrl").

double_test() ->
  ?assertEqual([1,1,2,2,3,3,4,4], practice2:double([1,2,3,4])).

evens_test() ->
  ?assertEqual([2,4], practice2:evens([1,2,3,4])).

median_test() ->
  ?assertEqual(3, practice2:median([1,2,3,4,5])).

modes_test() ->
  ?assertEqual([2], practice2:mode([1,2,2,3,4,2])).
