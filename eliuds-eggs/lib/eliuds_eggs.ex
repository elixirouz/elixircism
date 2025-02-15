defmodule EliudsEggs do
  @moduledoc """
  Implements recursive logic and sums the binary list to calculate the number of eggs.
  """

  def egg_count(number, acc \\ [])
  def egg_count(0, acc), do: Enum.sum(acc)

  @doc """
  `egg_count/2` converts from DEC to BIN and sums the elements of the resulting list.
  """
  @spec egg_count(number :: integer()) :: non_neg_integer()
  def egg_count(number, acc) do
    egg_count(div(number, 2), [rem(number, 2) | acc])
  end
end
