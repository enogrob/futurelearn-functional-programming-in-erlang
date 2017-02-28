-module(practice2).
-export([max_in_list/1]).

max_in_list(L) ->
  max_in_list(L, 0).

max_in_list([], C) ->
    C;
max_in_list([A|B], C) ->
  max_in_list(B, max(A,C)).
