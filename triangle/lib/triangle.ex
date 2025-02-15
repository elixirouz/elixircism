defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  def kind(0, 0, 0) do
    {:error, "all side lengths must be positive"}
  end

  def kind(a, b, c) when a < 0 or b < 0 or c < 0 do
    {:error, "all side lengths must be positive"}
  end

  def kind(a, b, c) when a + b < c or a + c < b or b + c < a do
    {:error, "side lengths violate triangle inequality"}
  end

  def kind(a, a, a), do: {:ok, :equilateral}
  def kind(a, a, _), do: {:ok, :isosceles}
  def kind(a, _, a), do: {:ok, :isosceles}
  def kind(_, a, a), do: {:ok, :isosceles}
  def kind(_, _, _), do: {:ok, :scalene}
end
