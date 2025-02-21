defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(
      inventory,
      fn x -> x.price end
    )
  end

  def with_missing_price(inventory) do
    Enum.filter(
      inventory,
      fn x -> x.price == nil end
    )
  end

  def update_names(inventory, old_word, new_word) do
    Enum.map(
      inventory,
      fn x ->
        if String.contains?(x.name, old_word) do
          updated_name = String.replace(x.name, old_word, new_word)
          %{x | name: updated_name}
        else
          x
        end
      end
    )
  end

  def increase_quantity(item, count) do
    quant_map = item.quantity_by_size

    updated_quant_map =
      Map.new(
        quant_map,
        fn {att, val} -> {att, val + count} end
      )

    %{item | quantity_by_size: updated_quant_map}
  end

  def total_quantity(item) do
    quant_map = item.quantity_by_size
    Enum.reduce(quant_map, 0, fn {_att, val}, acc -> val + acc end)
  end
end
