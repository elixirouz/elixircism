defmodule SquareRoot do
  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand) do
    calculate(radicand, 0, radicand)
  end

  @spec calculate(radicand :: pos_integer, pos_integer | 0, pos_integer) :: pos_integer
  defp calculate(radicand, left, right) do
    mid = left + div(right - left, 2)
    midsqr = mid * mid

    if left <= right do
      cond do
        midsqr == radicand -> mid
        midsqr < radicand -> calculate(radicand, mid + 1, right)
        midsqr > radicand -> calculate(radicand, left, mid - 1)
      end
    else
      right
    end
  end
end
