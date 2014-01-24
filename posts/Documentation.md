{
  title: "Turnusol Framework",
  date:  "2014-01-24",
  description: "Contains Framework Documentation"
}

![Turnusol Framework](http://mahmutbulut.com/turnusol/images/turnusol.jpg)

## Requirements

### Erlang

You can use the Erlang Solutions repository for installing Erlang. This system tested on erlang-mini that hasn't got additional
gui dependencies:
```bash
  sudo apt-get update
  sudo apt-get install erlang-mini
```
## Installation

For making and preparing shell just type:
```bash
  make all
```
when you are in the `turnusol` directory.
After that you can bring the shell with:
```bash
  make run
```
## Usage
Through this documentation `$> ` demonstrates Eshell.

### Drivers
Turnusol currently have GPIO drivers.

#### GPIO

##### Initialization

Input initialization of pins over turnusol can be:
```erlang
  $> tcore:init_input_pin(PinNumber).
```
If you want to initialize the pin as output you can use:
```erlang
  $> tcore:init_output_pin(PinNumber).
```
##### Digital Read / Write

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
### HCS (Hot Code Swapping / Hot Code Replacement)

#### Starting

Starting the hcs is easy. It is like:
```erlang
  $> tcore:start_hcs().
```
#### Stopping

Stopping the hcs is like:
```erlang
  $> tcore:stop_hcs().
```


# TODO

* zero abstraction with wiringpi
* pwm and others
* elixir support
* start shell through the bash without makefile dependent system (curl ?)
* write / read byte
* export and unexport
