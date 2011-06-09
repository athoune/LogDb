-module(logdb).
-author('mathieu@garambrogne.net').

-export([
    new/1,
    add_index/3,
    append/3
]).

new(Table) ->
    logdb_sup:start_child(Table).

add_index(_Pid, _Name, _Type) ->
    ok.

append(_Pid, _Key, _Values) ->
    ok.

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
    logdb_test() ->
        logdb_sup:start_link(),
        Pid = new(users).

-endif.