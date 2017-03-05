-module(index).
-export([index_gettysburg/0,index_dickens/0]).

% Get the contents of a text file into a list of lines.
get_file_contents(Name) ->
    {ok,File} = file:open(Name,[read]),
    Rev = get_all_lines(File,[]),
    lists:reverse(Rev).

% Auxiliary function for get_file_contents.
get_all_lines(File,Partial) ->
    case io:get_line(File,"") of
        eof -> file:close(File),
               Partial;
        Line -> {Strip,_} = lists:split(length(Line)-1,Line),
                get_all_lines(File,[Strip|Partial])
    end.

% Show the contents of a list of strings.
show_file_contents([L|Ls]) ->
    io:format("~s~n",[L]),
    show_file_contents(Ls);
show_file_contents([]) ->
    ok.

% Convert list of tuples to a string
list_of_tuples_to_string([]) ->
    "";
list_of_tuples_to_string([L|Ls]) ->
    io_lib:format("~p",[L]) ++ list_of_tuples_to_string(Ls).

% Index the gettysburg address
index_gettysburg() ->
    index_file('gettysburg-address.txt').

% Index dicken's christmas carol
index_dickens() ->
    index_file('dickens-christmas.txt').

% Index and display a file
index_file(FileName) ->
    show_file_contents(list_of_tuples_to_string(index(FileName))).

% Index a text file by line number
index(FileName) ->
    Lines=get_file_contents(FileName),
    Lines_numbered=number_lines(Lines),
    Words=words_from_list(Lines),
    Words_and_linenumbers=words_and_linenumbers(Words, Lines_numbered),
    {Words,LineNumbers}=lists:unzip(Words_and_linenumbers),
    lists:zip(Words,list_of_numbers_to_ranges(LineNumbers)).

% Transform list of linenumbers lists to list of linenumber ranges
list_of_numbers_to_ranges([]) -> [];
list_of_numbers_to_ranges([X|Xs]) ->
    [numbers_to_ranges(X)|list_of_numbers_to_ranges(Xs)].

% Transform linenumber list to range
numbers_to_ranges(Xs) ->
    numbers_to_ranges(Xs,[]).
numbers_to_ranges([],Acc) ->
    lists:reverse(Acc);
numbers_to_ranges([X|Xs],[]) ->
    numbers_to_ranges(Xs,[{X,X}]);
numbers_to_ranges([X|Xs],[{Low,High}|Ys]) when X-High==1 ->
    numbers_to_ranges(Xs,[{Low,X}|Ys]);
numbers_to_ranges([X|Xs],Acc) ->
    numbers_to_ranges(Xs,[{X,X}|Acc]).

% Number a list of strings into a list of tuples
number_lines(Lines) -> number_lines(Lines, 1).
number_lines([], _N) -> [];
number_lines([X|Xs], N) ->
    case X == [] of
        true -> number_lines(Xs, N+1);
        false -> [{N,X} | number_lines(Xs, N+1)]
    end.

% Split a list of lines of text into a list of words
words_from_lines(Lines) ->
    words_from_lines(Lines,[]).
words_from_lines([], Acc) ->
    lists:concat(Acc);
words_from_lines([Line|Lines], Acc) ->
    words_from_lines(Lines, [words_from_line(Line) | Acc]).

% Split a line on words and punctuation
words_from_line(Line) ->
    string:tokens(Line, " ;!:?-.,\\\t()\"").

% Remove words less that length 3
remove_short_words(Xs) ->
    lists:filter(fun(X)->length(X)>3 end, Xs).

% Remove duplicates
remove_duplicates([]) -> [];
remove_duplicates([X|Xs]) ->
    [X|remove_duplicates(lists:filter(fun(Y)->X=/=Y end,Xs))].

% Return sorted and pruned list of Words from list of strings
words_from_list(Lines) ->
    Words1=words_from_lines(Lines),
    Words2=lists:sort(Words1),
    Words3=remove_short_words(Words2),
           remove_duplicates(Words3).

% Transform a list of Words and Lines_numbered to list of tuples
words_and_linenumbers([],_Lines_numbered) ->
    [];
words_and_linenumbers([Word|Words],Lines_numbered) ->
    LineNumbers=line_numbers_has_word(Word, Lines_numbered),
    [{Word,LineNumbers} | words_and_linenumbers(Words,Lines_numbered)].

% Return list of line numbers of Lines_numbered that contain Word
line_numbers_has_word(Word, Lines_numbered) ->
    {LineNumbers,_}=lists:unzip(lists:filter(fun({_Number,Line}) -> lists:member(Word,words_from_line(Line)) end, Lines_numbered)),
    LineNumbers.
