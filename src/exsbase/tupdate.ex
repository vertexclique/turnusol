defmodule TUpdate do
  @moduledoc """
  Turnusol update subsystem functions
  """
  
  @doc """
  Starts Hot Code Swap system
  @spec start_hcs() -> go().
  """
  def start_hcs do
    :sync.go()
  end
  
  @doc """
  Starts Hot Code Swap system
  @spec start_hcs() -> go().
  """
  def stop_hcs do
    :sync.stop()
  end

  @doc """
  Loads specified module with default options
  @spec load_module(Module) -> compile:file(Module).
  """
  def load_module(modul) do
    :compile.file(modul)
  end

  @doc """
  Loads specified module with given options
  @spec load_module(Module, Opts) -> compile:file(Module, Opts).
  """
  def load_module(modul, opts) do
    :compile.file(modul, opts)
  end
  
  @doc """
  Loads all modules with built-in cover
  @spec load_all_modules() -> cover:compile_directory().
  """
  def load_all_modules do
    :cover.compile_directory()
  end

end