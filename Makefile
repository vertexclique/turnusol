# Requirements
# * wget
# 
export PATH := $(PATH)
PROJECT=turnusol
EILOC:=$(shell find /usr/local/lib/erlang /usr/lib/erlang -name ei.h -printf '%h\n' 2> /dev/null | head -1)
LDFLAGS=-Lpriv -L/usr/lib/erlang/usr/lib
UNAME := $(shell uname)
IEX := $(shell which iex)
CURDIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
ELIXIRVER=v0.12.2
GETELIXIR := wget https://github.com/elixir-lang/elixir/archive/$(ELIXIRVER).tar.gz
SHELLARGSERL=-setcookie TuRnUsOlFrAmE \
			-pz $(CURDIR)/deps/erlhw/deps/*/ebin \
			-pz $(CURDIR)/deps/erlhw/ebin \
			-pz $(CURDIR)/deps/erlhw/examples \
			-pz $(CURDIR)/deps/sync/ebin \
			-pz $(CURDIR)/ebin/

SHELLARGSEX=--cookie "TuRnUsOlFrAmE" \
			-pz $(CURDIR)/deps/erlhw/deps/*/ebin \
			-pz $(CURDIR)/deps/erlhw/ebin \
			-pz $(CURDIR)/deps/erlhw/examples \
			-pz $(CURDIR)/deps/sync/ebin \
			-pz $(CURDIR)/ebin/ \
			-r $(CURDIR)/src/exsbase/tcore.ex \
			-r $(CURDIR)/src/exsbase/tmware.ex \
			-r $(CURDIR)/src/exsbase/tupdate.ex

SHELLARGSEXBEAM=--cookie "TuRnUsOlFrAmE" \
			-pz $(CURDIR)/deps/erlhw/deps/*/ebin \
			-pz $(CURDIR)/deps/erlhw/ebin \
			-pz $(CURDIR)/deps/erlhw/examples \
			-pz $(CURDIR)/deps/sync/ebin \
			-pz $(CURDIR)/ebin/ \
			-pa $(CURDIR)src/exsbase/*.beam

SHELLARGSEXTEST=--cookie "TuRnUsOlFrAmE" \
			-pz $(CURDIR)/deps/erlhw/deps/*/ebin \
			-pz $(CURDIR)/deps/erlhw/ebin \
			-pz $(CURDIR)/deps/erlhw/examples \
			-pz $(CURDIR)/deps/sync/ebin \
			-pz $(CURDIR)/ebin/ \
			-pr $(CURDIR)/src/exsbase/*.ex

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

getelixir:
	$(GETELIXIR)

run:
	sudo erl -sname turnusol $(SHELLARGSERL) 

runex:
	sudo iex --sname "turnusol" $(SHELLARGSEX)

compileex:
	cd src/exsbase && mix compile && cd ../..
