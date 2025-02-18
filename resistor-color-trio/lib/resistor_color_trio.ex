defmodule ResistorColorTrio do
  @colormap %{
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

  @spec value(colors :: [atom]) :: integer
  defp value([c1, c2 | _]), do: @colormap[c1] * 10 + @colormap[c2]

  defp do_exp(value, expon) do
    case expon do
      # Handle for minimum value edge case
      0 -> {0, :ohms}
      1 -> {value, :ohms}
      1000 -> {value, :kiloohms}
      1_000_000 -> {value, :megaohms}
      1_000_000_000 -> {value, :gigaohms}
      # Handle for non-standard exponents, by compensating in value
      _ -> do_exp(value * 10, div(expon, 10))
    end
  end

  defp get_rem(value, acc) do
    if rem(value, 10) == 0 do
      acc = acc * 10
      get_rem(div(value, 10), acc)
    else
      {value, acc}
    end
  end

  @doc """
  Calculate the resistance value in ohms from resistor colors
  """
  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}
  def label([_c1, _c2, c3 | _] = colors) do
    # Calculate resister color-duo value
    value = value(colors)

    # Calculate the normalized value and the exponent
    {norm, tpow} =
      if value >= 1 do
        get_rem(value, 1)
      else
        {0, 0}
      end

    # Calculate the actual exponent
    expon = 10 ** @colormap[c3] * tpow
    # Convert the exponent to standard units
    do_exp(norm, expon)
  end
end
