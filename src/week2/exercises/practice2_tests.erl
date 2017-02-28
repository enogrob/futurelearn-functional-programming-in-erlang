% To run tests:
% erl -make
% erl -noshell -eval "eunit:test(leap, [verbose])" -s init stop
%

-module(practice2_tests).

-include_lib("eunit/include/eunit.hrl").

max_in_list1_test() ->
  ?assertEqual(4, practice2:max_in_list([1,2,3,4])).

max_in_list2_test() ->
  ?assertEqual(30, practice2:max_in_list([1,2,30,4,5])).
