PROJECT=turnusol
EILOC:=$(shell find /usr/local/lib/erlang /usr/lib/erlang -name ei.h -printf '%h\n' 2> /dev/null | head -1)
LDFLAGS=-Lpriv -L/usr/lib/erlang/usr/lib
UNAME := $(shell uname)
CURDIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
SHELLARGS=-setcookie TuRnUsOlFrAmE \
			-pa $(CURDIR)/deps/erlhw/deps/*/ebin \
			-pa $(CURDIR)/deps/erlhw/ebin \
			-pa $(CURDIR)/deps/erlhw/examples \
			-pa $(CURDIR)/deps/sync/ebin \
			-pa $(CURDIR)/ebin/

all: getdeps makedeps copypriv compile

getdeps:
	./rebar get-deps

makedeps:
	cd deps/erlhw && make && cd ..

copypriv:
	cp -R deps/erlhw/priv .

compile:
	./rebar compile

clean:
	./rebar clean
	./rebar delete-deps
	rm -rf deps ebin

run:
	sudo erl -sname turnusol $(SHELLARGS) 