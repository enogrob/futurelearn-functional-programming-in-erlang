% To run tests:
% erl -make
% erl -noshell -eval "eunit:test(leap, [verbose])" -s init stop
%

-module(practice1_tests).

-include_lib("eunit/include/eunit.hrl").

prod_tail_test() ->
  ?assertEqual(24, practice1:prod_tail([1,2,3,4])).

prod_direct_test() ->
  ?assertEqual(24, practice1:prod_direct([1,2,3,4])).

max_in_list1_test() ->
  ?assertEqual(4, practice1:max_in_list([1,2,3,4])).
  
max_in_list2_test() ->
  ?assertEqual(30, practice1:max_in_list([1,2,30,4,5])).
