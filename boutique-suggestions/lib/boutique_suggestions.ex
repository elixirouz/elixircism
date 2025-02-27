defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    combo(tops, bottoms, options[:maximum_price] || 100.0)
  end

  defp combo(tops, bots, price) do
    for x <- tops, y <- bots, x.base_color != y.base_color and x.price + y.price <= price do
      {x, y}
    end
  end
end
