-module(pieces).
-export([piece/1]).

piece(0) ->
  1;

piece(N) when N > 0 ->
  piece(N-1) + N.
