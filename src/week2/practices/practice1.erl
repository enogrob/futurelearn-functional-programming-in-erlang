-module(practice1).
-export([prod_tail/1,prod_direct/1, max_in_list/1]).

prod_tail(L) ->
  prod_tail(L, 1).

prod_tail([], C) ->
    C;
prod_tail([A|B], C) ->
  prod_tail(B, A*C).

prod_direct([]) ->
  1;
prod_direct([A|B]) ->
  A * prod_direct(B).

max_in_list(L) ->
  max_in_list(L, 0).
max_in_list([], C) ->
  C;
max_in_list([A|B], C) ->
  max_in_list(B, max(A,C)).
