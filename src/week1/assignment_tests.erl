% To run tests:
% erl -make
% erl -noshell -eval "eunit:test(leap, [verbose])" -s init stop
%

-module(assignment_tests).

-include_lib("eunit/include/eunit.hrl").

perimeter_rectangle_test() ->
  ?assertEqual(12, assignment:perimeter({rectangle,2,4})).

perimeter_square_test() ->
  ?assertEqual(16, assignment:perimeter({square,4})).

perimeter_triangle_test() ->
  ?assertEqual(14, assignment:perimeter({triangle,2,4,8})).

perimeter_circle_test() ->
  ?assertEqual(2*math:pi()*4, assignment:perimeter({circle,4})).


area_rectangle_test() ->
  ?assertEqual(8, assignment:area({rectangle,2,4})).

area_square_test() ->
  ?assertEqual(16, assignment:area({square,4})).

area_triangle_test() ->
  ?assertEqual(4.0, assignment:area({triangle,2,4})).

area_circle_test() ->
  ?assertEqual(math:pi()*4*4, assignment:area({circle,4})).


bits0_test() ->
  ?assertEqual(0, assignment:bits(0)).

bits1_test() ->
  ?assertEqual(1, assignment:bits(1)).

bits2_test() ->
  ?assertEqual(2, assignment:bits(3)).

bits3_test() ->
  ?assertEqual(3, assignment:bits(7)).
