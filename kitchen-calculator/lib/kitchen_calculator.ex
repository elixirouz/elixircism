defmodule KitchenCalculator do
  @conversion_table %{
    milliliter: 1,
    cup: 240,
    fluid_ounce: 30,
    teaspoon: 5,
    tablespoon: 15
  }

  def get_volume({_, vol}), do: vol

  def to_milliliter({inp_units, vol}),
    do: {:milliliter, @conversion_table[inp_units] * vol}

  def from_milliliter({:milliliter, vol}, tgt),
    do: {tgt, vol / @conversion_table[tgt]}

  def convert(inp_tuple, tgt),
    do:
      to_milliliter(inp_tuple)
      |> from_milliliter(tgt)
end
