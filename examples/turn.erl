-module(turn).
-export([blink/0]).

blink() ->
	tcore:init_output_pin(17),
	tcore:write_high(17),
	timer:sleep(300),
	tcore:write_low(17),
	timer:sleep(300),
	blink().



%% just two steps; 1: c(turn).   2: turn:blink(). 

%% infinite led blink in erlang

%% @copyright 2014 Mahmut Bulut(vertexclique) and F.Hüseyin Çolak(martymcfly16)
