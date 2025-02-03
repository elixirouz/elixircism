defmodule BirdCount do
  def today([]), do: nil

  @spec today([integer()]) :: integer() | nil
  def today([today_count | _]) do
    today_count
  end

  def increment_day_count([]), do: [1]

  @spec increment_day_count([integer()]) :: [integer()]
  def increment_day_count([today_count | tail]) do
    [today_count + 1 | tail]
  end

  def has_day_without_birds?([]), do: false

  @spec has_day_without_birds?([integer()]) :: boolean()
  def has_day_without_birds?([head | tail]) do
    cond do
      head == 0 -> true
      true -> has_day_without_birds?(tail)
    end
  end

  def total([]), do: 0

  @spec total([integer()]) :: integer()
  def total([head | tail]) do
    head + total(tail)
  end

  # Base case to stop recursion
  def busy_days([]), do: 0

  @doc """
  Add one and recurse, when the day is a busy day.
  Just recurse, when its not a busy day.

  Alternative implementation using cond
  ```
  def busy_days([head | tail]) do
    cond do
      head >= 5 -> 1 + busy_days(tail)
      true -> busy_days(tail)
    end
  end
  ```
  """

  # Implementation using guards & multiple clauses
  @spec busy_days([integer()]) :: integer()
  def busy_days([head | tail]) when head >= 5 do
    1 + busy_days(tail)
  end

  def busy_days([_head | tail]), do: busy_days(tail)
end
