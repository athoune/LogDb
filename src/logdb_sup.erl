-module(logdb_sup).

-behaviour(supervisor).

-define(SERVER, ?MODULE).

%% API
-export([
    start_link/0,
    start_child/1
]).

%% Supervisor callbacks
-export([init/1]).

%% Helper macro for declaring children of supervisor
-define(CHILD(I, Type), {I, {I, start_link, []}, permanent, 5000, Type, [I]}).

%% ===================================================================
%% API functions
%% ===================================================================

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%% ===================================================================
%% Supervisor callbacks
%% ===================================================================

init([]) ->
    {ok, { {simple_one_for_one, 0, 1}, [
        ?CHILD(logdb_table, worker)
    ] } }.

start_child(Name) ->
    supervisor:start_child(?SERVER, [Name]).