defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new(nickname \\ "none") do
    %RemoteControlCar{nickname: "#{nickname}"}
  end

  def display_distance(remote_car) when remote_car |> is_struct(RemoteControlCar) do
    "#{remote_car.distance_driven_in_meters} meters"
  end

  def display_battery(remote_car) when remote_car |> is_struct(RemoteControlCar) do
    bat = remote_car.battery_percentage

    (fn
       bat when bat == 0 -> "Battery empty"
       _ -> "Battery at #{bat}%"
     end).(bat)
  end

  def drive(remote_car) when remote_car |> is_struct(RemoteControlCar) do
    dist = remote_car.distance_driven_in_meters

    %{
      remote_car
      | battery_percentage:
          (fn
             bat when bat > 0 -> bat - 1
             bat -> bat
           end).(remote_car.battery_percentage),
        distance_driven_in_meters:
          (fn
             bat when bat > 0 -> dist + 20
             _ -> dist
           end).(remote_car.battery_percentage)
    }
  end
end
