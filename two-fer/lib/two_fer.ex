defmodule TwoFer do
  @moduledoc """
  The `TwoFer` module provides functionality to generate a string that follows the
  "two for one" concept, where one item is designated for a specified person and
  another for the speaker.

  ## Functions

    * `two_fer/1` - Returns a string in the format "One for [name], one for me."
      If no name is provided, it defaults to "you".

  ## Examples

      iex> TwoFer.two_fer("Alice")
      "One for Alice, one for me."

      iex> TwoFer.two_fer()
      "One for you, one for me."
  """

  @doc """
  Two-fer or 2-fer is short for two for one. One for you and one for me.
  """
  @spec two_fer(String.t()) :: String.t()
  def two_fer(name \\ "you") when is_binary(name) do
    "One for #{name}, one for me."
  end
end
