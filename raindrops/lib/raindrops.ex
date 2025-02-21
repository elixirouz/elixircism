defmodule Raindrops do
  @prime_map %{
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }

  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    check = [3, 5, 7]

    do_check(number, check, "")
    |> then(fn x ->
      case x do
        "" -> "#{number}"
        _ -> x
      end
    end)
  end

  defp do_check(_number, [], acc), do: acc

  defp do_check(number, [head | tail], acc) do
    if rem(number, head) == 0 do
      do_check(number, tail, acc <> Map.get(@prime_map, head))
    else
      do_check(number, tail, acc)
    end
  end
end
