defmodule Username do
  def sanitize(username) do
    username
    |> Enum.flat_map(fn char ->
      case char do
        ?ä -> [?a, ?e]
        ?ö -> [?o, ?e]
        ?ü -> [?u, ?e]
        ?ß -> [?s, ?s]
        x -> [x]
      end
    end)
    |> Enum.filter(fn char ->
      case char do
        char when char >= ?a and char <= ?z -> true
        ?_ -> true
        _ -> false
      end
    end)
  end
end
