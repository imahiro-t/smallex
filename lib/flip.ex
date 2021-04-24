defmodule Flip do
  @moduledoc """
  Flip function.
  """

  @doc """
  Flip function parameter

  ## Examples
      iex> "abcd" |> Flip.flip(&Regex.named_captures/2).(~r/a(?<foo>b)c(?<bar>d)/)
      %{"bar" => "d", "foo" => "b"}
      iex> " = " |> Flip.flip(&Enum.map_join/3).([1, 2, 3], &(&1 * 2))
      "2 = 4 = 6"
      iex> (&(&1 * 2)) |> Flip.flip(&Enum.map_join/3, 3).([1, 2, 3], " = ")
      "2 = 4 = 6"
      iex> 3 |> Flip.flip(&Enum.chunk_every/4).([1, 2, 3, 4, 5, 6], 2, [7])
      [[1, 2, 3], [3, 4, 5], [5, 6, 7]]
      iex> [7] |> Flip.flip(&Enum.chunk_every/4, 4).([1, 2, 3, 4, 5, 6], 3, 2)
      [[1, 2, 3], [3, 4, 5], [5, 6, 7]]
  """
  def flip(func), do: flip(func, 2)
  def flip(func, 2) when is_function(func, 2), do: fn a, b -> func.(b, a) end
  def flip(func, 2) when is_function(func, 3), do: fn a, b, c -> func.(b, a, c) end
  def flip(func, 3) when is_function(func, 3), do: fn a, b, c -> func.(b, c, a) end
  def flip(func, 2) when is_function(func, 4), do: fn a, b, c, d -> func.(b, a, c, d) end
  def flip(func, 3) when is_function(func, 4), do: fn a, b, c, d -> func.(b, c, a, d) end
  def flip(func, 4) when is_function(func, 4), do: fn a, b, c, d -> func.(b, c, d, a) end
end
