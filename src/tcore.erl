%% @doc Turnusol framework core module
%%
%% It does hot code swap with sync, GPIO pin initialization, GPIO pin write and read
%%
%% @end
%% @copyright 2014 Mahmut Bulut

-module (tcore).

-export([init_input_pin/1,
			init_output_pin/1,
			write_high/1,
			write_low/1,
			read_pin/1,
			start_hcs/0,
			stop_hcs/0,
			load_module/1,
			load_module/2,
			load_all_modules/0]).

-import (gpio, [write/2,
				read/1]).

-import (gpio_sup, [start_link/1]).

-import (sync, [go/0, stop/0]).

%%hello_world() -> io:fwrite("hello, world\n").

init_input_pin(Pin) -> start_link([{Pin, input}]).

init_output_pin(Pin) -> start_link([{Pin, output}]).

write_high(Pin) -> write(Pin, 1).

write_low(Pin) -> write(Pin, 0).

read_pin(Pin) -> read(Pin).

start_hcs() -> go().

stop_hcs() -> stop().

load_module(Module) -> compile:file(Module).

load_module(Module, Opts) -> compile:file(Module, Opts).

load_all_modules() -> cover:compile_directory().

%autoload_hcs() ->