defmodule Sublist do
  defp sublist?([], _b), do: false

  defp sublist?(a, b) do
    List.starts_with?(a, b) || sublist?(tl(a), b)
  end

  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) when a != [] and b != [] do
    if length(a) == length(b) do
      if a === b, do: :equal, else: :unequal
    else
      cond do
        sublist?(a, b) -> :superlist
        sublist?(b, a) -> :sublist
        true -> :unequal
      end
    end
  end

  def compare([], []), do: :equal
  def compare(_a, []), do: :superlist
  def compare([], _b), do: :sublist
end
