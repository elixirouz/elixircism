top = %{
  item_name: "Sano Long Sleeve Shirt",
  price: 45.47,
  color: "Linen Chambray",
  base_color: "yellow"
}

bottom = %{
  item_name: "Happy Hike Studio Pants",
  price: 99.00,
  color: "Ochre Red",
  base_color: "red"
}

BoutiqueSuggestions.get_combinations([top], [bottom], other_option: "test")
