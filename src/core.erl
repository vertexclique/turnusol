-module (core).

-export([hello_world/0]).

hello_world() -> io:fwrite("hello, world\n").