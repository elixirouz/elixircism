defmodule LibraryFees do
  def datetime_from_string(string) do
    {:ok, date} = NaiveDateTime.from_iso8601(string)
    date
  end

  def before_noon?(datetime) do
    Time.before?(NaiveDateTime.to_time(datetime), ~T[12:00:00])
  end

  def return_date(checkout_datetime) do
    if before_noon?(checkout_datetime) do
      NaiveDateTime.add(checkout_datetime, 28, :day) |> NaiveDateTime.to_date()
    else
      NaiveDateTime.add(checkout_datetime, 29, :day) |> NaiveDateTime.to_date()
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    diff = Date.diff(NaiveDateTime.to_date(actual_return_datetime), planned_return_date)
    if diff <= 0, do: 0, else: diff
  end

  def monday?(datetime) do
    case Date.day_of_week(NaiveDateTime.to_date(datetime)) do
      1 -> true
      _ -> false
    end
  end

  def calculate_late_fee(checkout, return, rate) do
    days =
      days_late(
        return_date(datetime_from_string(checkout)),
        datetime_from_string(return)
      )

    cond do
      monday?(datetime_from_string(return)) -> (0.5 * days * rate) |> floor()
      true -> (days * rate) |> floor()
    end
  end
end
