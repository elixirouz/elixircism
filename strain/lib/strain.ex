defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    foreach(list, fun)
  end

  defp foreach([], _fun), do: []

  defp foreach([head | tail], fun) do
    if fun.(head) do
      [head | foreach(tail, fun)]
    else
      foreach(tail, fun)
    end
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    fornoteach(list, fun)
  end

  defp fornoteach([], _fun), do: []

  defp fornoteach([head | tail], fun) do
    if not fun.(head) do
      [head | fornoteach(tail, fun)]
    else
      fornoteach(tail, fun)
    end
  end
end
