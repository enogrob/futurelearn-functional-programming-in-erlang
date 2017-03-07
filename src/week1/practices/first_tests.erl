% To run tests:
% erl -make
% erl -noshell -eval "eunit:test(leap, [verbose])" -s init stop
%

-module(first_tests).

-include_lib("eunit/include/eunit.hrl").

multi_test() ->
  ?assertEqual(6, first:mult(2,3)).

double_test() ->
  ?assertEqual(6, first:double(3)).

area_test() ->
  ?assertEqual(10.825317547305483, first:area(5,5,5)).

square_test() ->
  ?assertEqual(2.0, first:square(4)).

treble_test() ->
  ?assertEqual(6, first:treble(2)).
