defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    base_map =
      base
      |> String.downcase()
      |> map_chars()

    Enum.filter(
      candidates,
      fn
        candidate ->
          if String.downcase(candidate) == String.downcase(base) do
            false
          else
            String.downcase(candidate)
            |> map_chars()
            |> anagram?(base_map)
          end
      end
    )
  end

  defp anagram?(candidate_map, base_map) do
    Map.equal?(candidate_map, base_map)
  end

  defp map_chars(string) do
    String.graphemes(string)
    |> do_map_chars(%{})
  end

  defp do_map_chars([], map), do: map

  defp do_map_chars([head | tail], map) do
    case Map.get(map, head) do
      nil ->
        do_map_chars(tail, Map.put(map, head, 1))

      found_value ->
        do_map_chars(tail, Map.put(map, head, found_value + 1))
    end
  end
end
