defmodule FreelancerRates do
  @billable_days 22
  def daily_rate(hourly_rate), do: 8.0 * hourly_rate

  def apply_discount(before_discount, discount),
    do: before_discount - before_discount * discount / 100

  @doc """
  The return of this function can be normally implemented as
  ```
  iex> trunc(Float.ceil(apply_discount(daily_rate(hourly_rate) * @billable_days, discount)))
  ```
  But the pipe operator enhances readability
  ```
  apply_discount(daily_rate(hourly_rate) * @billable_days, discount)
  |> Float.ceil()
  |> trunc()
  ```
  """
  def monthly_rate(hourly_rate, discount),
    do:
      apply_discount(daily_rate(hourly_rate) * @billable_days, discount)
      |> Float.ceil()
      |> trunc()

  def days_in_budget(budget, hourly_rate, discount),
    do:
      (budget / apply_discount(daily_rate(hourly_rate), discount))
      |> Float.floor(1)
end
