-module(practice1).
-export([prod_tail/1,prod_direct/1]).

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
