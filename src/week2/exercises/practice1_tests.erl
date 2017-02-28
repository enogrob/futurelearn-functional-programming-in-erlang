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
