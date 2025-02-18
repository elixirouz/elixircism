defmodule ResistorColorDuo do
  @res_col %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @doc """
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer
  def value([c1, c2]), do: rcd(c1, c2)

  @spec value(colors :: [atom]) :: integer
  def value([c1 | [c2 | [_tail]]]), do: rcd(c1, c2)

  defp rcd(c1, c2), do: @res_col[c1] * 10 + @res_col[c2]
end
