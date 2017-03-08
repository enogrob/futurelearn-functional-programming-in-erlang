% To run tests:
% erl -make
% erl -noshell -eval "eunit:test(leap, [verbose])" -s init stop
%

-module(practice1_tests).

-include_lib("eunit/include/eunit.hrl").

doubleAll_test() ->
  ?assertEqual([2,4,6], practice1:doubleAll([1,2,3])).

evens_test() ->
  ?assertEqual([2], practice1:evens([1,2,3])).

product_test() ->
  ?assertEqual(6, practice1:product([1,2,3])).

zip_test() ->
  ?assertEqual([{1,2},{3,4}], practice1:zip([1,3,5,7], [2,4])).

zip_with_test() ->
  F = fun(X,Y) -> X+Y end,
  ?assertEqual([3,7], practice1:zip_with(F,[1,3,5,7], [2,4])).

zip_with2_test() ->
  F = fun(X,Y) -> X+Y end,
  ?assertEqual([3,7], practice1:zip_with2(F,[1,3,5,7], [2,4])).

zip2_test() ->
  ?assertEqual([{1,2},{3,4}], practice1:zip2([1,3,5,7], [2,4])).
