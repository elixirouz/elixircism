defmodule Lasagna do
  # 40 minutes is the expected time to cook lasagna in the oven
  def expected_minutes_in_oven, do: 40

  # remaining time can be calculated by subtracting the time inside from the expected time
  def remaining_minutes_in_oven(time_inside), do: expected_minutes_in_oven() - time_inside

  # the preparation time is twice the number of layers
  def preparation_time_in_minutes(layers), do: 2 * layers

  # the total time would be the time for preparing the layers added with the time in oven
  def total_time_in_minutes(layers, time_inside),
    do: preparation_time_in_minutes(layers) + time_inside

  # an alarm function to return a Ding!
  def alarm, do: "Ding!"
end
