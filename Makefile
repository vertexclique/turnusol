PROJECT=turnusol
EILOC:=$(shell find /usr/local/lib/erlang /usr/lib/erlang -name ei.h -printf '%h\n' 2> /dev/null | head -1)
LDFLAGS=-Lpriv -L/usr/lib/erlang/usr/lib
UNAME := $(shell uname)

all: getdeps makedeps copypriv compile

getdeps:
	./rebar get-deps

makedeps:
	cd deps/erlhw && make && cd ..

copypriv:
	mkdir priv && cp -R deps/erlhw/priv .

compile:
	./rebar compile

clean:
	./rebar clean
	./rebar delete-deps
	rm -rf deps ebin

run:
	sudo erl -sname turnusol -setcookie TuRnUsOlFrAmE -pz deps/erlhw/deps/*/ebin -pz deps/erlhw/ebin -pz deps/erlhw/examples -pz ebin/