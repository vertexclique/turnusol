![Turnusol Framework](https://raw.github.com/vertexclique/turnusol/gh-pages/images/turnusol.jpg)

# Turnusol
[![Build Status](https://travis-ci.org/vertexclique/turnusol.png?branch=master)](https://travis-ci.org/vertexclique/turnusol)

## Requirements

### Erlang

You can use the Erlang Solutions repository for installing Erlang. This system tested on erlang-mini that hasn't got additional
gui dependencies:
```bash
sudo apt-get update
sudo apt-get install erlang-mini
```
### Elixir

If you want to get elixir interaction
```bash
make getelixir
```

Symlink the core modules like below (or include in global path)

Elixir executable
```bash
sudo ln -s ~/elixir-0.12.2/bin/elixir /usr/local/bin/elixir
```

Elixir compiler
```bash
sudo ln -s ~/elixir-0.12.2/bin/elixirc /usr/local/bin/elixirc
```

Mix
```bash
sudo ln -s ~/elixir-0.12.2/bin/mix /usr/local/bin/mix
```

Interactive elixir
```bash
sudo ln -s ~/elixir-0.12.2/bin/iex /usr/local/bin/iex
```

## Installation

For making and preparing shell just type:
```bash
make all
```
when you are in the `turnusol` directory.
After that you can bring the shell

### for erlang
```bash
make run
```
### for elixir
```bash
make runex
```
## Usage
Through this documentation `$> ` demonstrates Eshell and Iex.

### Core functions

#### Erlang

#### Elixir
Kill the underlying erlang system
```elixir
$> TCore.kill_all
```

### Drivers
Turnusol currently have GPIO drivers. (also I2C and SPI from erlang-ale but not implemented deeply yet)

#### GPIO

##### Erlang Initialization

Input initialization of pins over turnusol can be:
```erlang
$> tcore:init_input_pin(PinNumber).
```
If you want to initialize the pin as output you can use:
```erlang
$> tcore:init_output_pin(PinNumber).
```
##### Erlang Digital Read / Write

Digital write can be used via `tcore`. If you want to write HIGH (1) use:
```erlang
$> tcore:write_high(PinNumber).
```
If you want to write LOW (0) use:
```erlang
$> tcore:write_low(PinNumber).
```
Digital read can be used via `tcore`:
```erlang
$> tcore:read_pin(PinNumber).
```

##### Elixir Initialization

Input initialization of pins
```elixir
$> TCore.init_input_pin pinNumber
```
If you want to initialize the pin as output you can use:
```elixir
$> TCore.init_output_pin pinNumber
```
##### Elixir Digital Read / Write

Digital write can be used via `TCore`. If you want to write HIGH (1) use:
```elixir
$> TCore.write_high pinNumber
```
If you want to write LOW (0) use:
```elixir
$> TCore.write_low pinNumber
```
Digital read can be used via `TCore`:
```elixir
$> TCore.read_pin pinNumber
```

### HCS (Hot Code Swapping / Hot Code Replacement)

#### Erlang
##### Starting

Starting the hcs is easy. It is like:
```erlang
$> tupdate:start_hcs().
```
##### Stopping

Stopping the hcs is like:
```erlang
$> tupdate:stop_hcs().
```

#### Elixir
_**WARNING: Currently this is not working because of elixir support is not builded in sync**_
##### Starting

Starting the hcs is easy. It is like:
```elixir
$> TUpdate.start_hcs
```
##### Stopping

Stopping the hcs is like:
```elixir
$> TUpdate.stop_hcs
```


* * *

# TODO

* zero abstraction with wiringpi
* pwm and others
* elixir support [barely done]
* start shell through the bash without makefile dependent system (curl ?) [started with python]
* write / read byte
* export and unexport
* http server
* rest
* reduce argument count on execution for shell

* * *

* sandboxing (go | c | cpp)
* mechanism for disallowing tampering
* mechanism for device auth
* mechanism for sec boot (not possible for now)

