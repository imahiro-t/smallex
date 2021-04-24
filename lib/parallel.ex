defmodule Parallel do
  @moduledoc """
  Parallel utiity.
  """

  @doc """
  map parallel

  ## Examples
      iex> Parallel.pmap([1, 2, 3], fn x -> x * 2 end)
      [2, 4, 6]
  """
  def pmap(enumerable, func ,timeout \\ 5000) do
    enumerable
    |> Enum.map(&(Task.async(fn -> func.(&1) end)))
    |> Enum.map(&(Task.await(&1, timeout)))
  end
end
