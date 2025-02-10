defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @planet_orbital_factor %{
    mercury: 0.2408467,
    venus: 0.61519726,
    earth: 1.0,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }
  @earth_year_in_seconds 60 * 60 * 24 * 365.25
  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  """
  @spec age_on(planet, pos_integer) :: {:ok, float} | {:error, String.t()}
  def age_on(planet, seconds) do
    if Map.get(@planet_orbital_factor, planet) do
      earth_age_in_years = seconds / @earth_year_in_seconds
      {:ok, earth_age_in_years / @planet_orbital_factor[planet]}
    else
      {:error, "not a planet"}
    end
  end
end
