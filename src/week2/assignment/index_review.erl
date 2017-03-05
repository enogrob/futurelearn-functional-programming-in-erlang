-module(index_review). 
-export([showIndex/1]).

% Used to read a file into a list of lines.
% Example files available in:
% gettysburg-address.txt (short)
% dickens-christmas.txt (long)
% Get the contents of a text file into a list of lines.
% Each line has its trailing newline removed.

get_file_contents(Name) ->
{ok,File} = file:open(Name,[read]),
Rev = get_all_lines(File,[]),
lists:reverse(Rev).

% Auxiliary function for get_file_contents.
% Not exported.

get_all_lines(File,Partial) ->
case io:get_line(File,"") of
eof -> file:close(File),
Partial;
Line -> {Strip,_} = lists:split(length(Line)-1,Line),
get_all_lines(File,[Strip|Partial])
end.

% turns [1,2,3,7,9,10] into [{1,3}{7,7},{9,10}]
listToIntervals([])->[];
listToIntervals([X|Xs])->listToIntervals({X, X}, Xs).
listToIntervals(X, [])->X;
listToIntervals({X1, X2}, [Y| Ys]) ->
case X2 == Y-1 of
true -> listToIntervals({X1,Y}, Ys);
false-> [{X1,X2}| listToIntervals([Y| Ys])]
end.

% takes a number and a list of words and returns a list of {word, number}
wordLineNumber(_, [])->[];
wordLineNumber(N, [X|Xs])-> [{X, N}|wordLineNumber(N, Xs)].

% takes a list of lines and returns a list of {word, number}
wordsByLine(X)->wordsByLine(0, X).
wordsByLine(_, [])->[];
wordsByLine(N, [X|Xs])->
wordLineNumber(N, string:tokens(X, ",.?!;:'\"\\ ")) ++ wordsByLine(N+1, Xs).

% takes a list of {word, number} and returns a list of {word, [numbers]}
wordListToIndex([], {Xw, Xs}) -> [{Xw, lists:reverse(Xs)}];
wordListToIndex([{Xw, Xn}|Xs], {Xw, Ys}) ->
wordListToIndex(Xs, {Xw, [Xn|Ys]});
wordListToIndex([{Xw, Xn}|Xs], {Yw, Ys}) ->
[ {Yw, lists:reverse(Ys)} | wordListToIndex(Xs, {Xw, [Xn]})];
wordListToIndex([{Xw, Xn}|Xs], {}) ->
wordListToIndex(Xs, {Xw, [Xn]}).

% this function does most of the "tidying up" (converts to lowercase, checks string size and # of occurrences and calls
% 'listToIntervals' to show line numbers as lists of intervals instead of just the line numbers)
normalize([])->[];
normalize([X|Xs])->
{Xw,Xns}=X,
case (length(Xw)<4) or (length(Xns)>20) of
true -> normalize(Xs);
false-> [{string:to_lower(Xw), listToIntervals(Xns)}| normalize(Xs)]
end.

index(X)->
N = wordsByLine(X),
S = lists:sort(N),
I = wordListToIndex(S, {}),
normalize(I).

printIndexLines([{W, Ns}|Xs])->
io:format("~p - ~p~n",[W, Ns]),
printIndexLines(Xs);
printIndexLines([]) ->
ok.

showIndex(F) ->
printIndexLines(index(get_file_contents(F))).
