-module (tupdate).

-export ([start_hcs/0,
			stop_hcs/0,
			load_module/1,
			load_module/2,
			load_all_modules/0]).

-import (sync, [go/0, stop/0]).

start_hcs() -> go().

stop_hcs() -> stop().

load_module(Module) -> compile:file(Module).

load_module(Module, Opts) -> compile:file(Module, Opts).

load_all_modules() -> cover:compile_directory().

%autoload_hcs() ->