-module(logdb).
-author('mathieu@garambrogne.net').

-export([
    new/1,
    add_index/4,
    append/3
]).

new(Table) ->
    logdb_sup:start_child(Table).

add_index(Pid, Name, Fun, Type) ->
    gen_server:call(Pid, {add_index, Name, Fun, Type}).

append(Pid, Key, Values) ->
    gen_server:cast(Pid, {append, Key, Values}).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
    logdb_test() ->
        logdb_sup:start_link(),
        Pid = new(users),
        append(Pid, 42, {hop, 4807}).

-endif.