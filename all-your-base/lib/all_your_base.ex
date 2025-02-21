defmodule AllYourBase do
  def convert(_, input_base, _output_base) when input_base < 2,
    do: {:error, "input base must be >= 2"}

  def convert(_, _input_base, output_base) when output_base < 2,
    do: {:error, "output base must be >= 2"}

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(digits, input_base, output_base) do
    cond do
      Enum.any?(digits, &(&1 < 0 or &1 >= input_base)) ->
        {:error, "all digits must be >= 0 and < input base"}

      true ->
        {:ok, digits |> Integer.undigits(input_base) |> Integer.digits(output_base)}
    end
  end
end
