% To run tests:
% erl -make
% erl -noshell -eval "eunit:test(leap, [verbose])" -s init stop
%

-module(second_tests).

-include_lib("eunit/include/eunit.hrl").

hypotenuse_test() ->
  ?assertEqual(3.605551275463989, second:hypotenuse(2,3)).

perimeter_test() ->
  ?assertEqual(8.60555127546399, second:perimeter(2,3)).
