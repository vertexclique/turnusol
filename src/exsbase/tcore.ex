defmodule TCore do
  @moduledoc """
  Turnusol core functions
  """

  @doc """
  See Erlang implementation
  init_input_pin(Pin) -> start_link([{Pin, input}]).
  """
  def init_input_pin(pin) do
    :gpio_sup.start_link([{pin, :input}])
  end

  @doc """
  See Erlang implementation
  init_output_pin(Pin) -> start_link([{Pin, output}]).
  """
  def init_output_pin(pin) do
    :gpio_sup.start_link([{pin, :output}])
  end
  
  @doc """
  See Erlang implementation
  write_high(Pin) -> write(Pin, 1).
  """
  def write_high(pin) do
    :gpio.write(pin, 1)
  end

  @doc """
  See Erlang implementation
  write_low(Pin) -> write(Pin, 0).
  """
  def write_low(pin) do
    :gpio.write(pin, 0)
  end
  
  @doc """
  See Erlang implementation
  read_pin(Pin) -> read(Pin).
  """
  def read_pin(pin) do
    :gpio.read(pin)
  end

  @doc """
  Quits from shell and kills all nodes underlying the system
  """
  def kill_all do
    :erlang.halt()
  end
end