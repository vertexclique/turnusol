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
			read_pin/1]).

-import (gpio, [write/2,
				read/1]).

% i2c, spi modules, usb?
% vsn ? version

-import (gpio_sup, [start_link/1]).

%%hello_world() -> io:fwrite("hello, world\n").

init_input_pin(Pin) -> start_link([{Pin, input}]).

init_output_pin(Pin) -> start_link([{Pin, output}]).

write_high(Pin) -> write(Pin, 1).

write_low(Pin) -> write(Pin, 0).

read_pin(Pin) -> read(Pin).
