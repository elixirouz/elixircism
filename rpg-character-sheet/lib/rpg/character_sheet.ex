defmodule RPG.CharacterSheet do
  defp trim_iogets(disp_string), do: IO.gets(disp_string) |> String.trim()
  def welcome, do: IO.puts("Welcome! Let's fill out your character sheet together.")
  def ask_name, do: trim_iogets("What is your character's name?\n")
  def ask_class, do: trim_iogets("What is your character's class?\n")
  def ask_level, do: trim_iogets("What is your character's level?\n") |> String.to_integer()

  def run do
    welcome()
    name = ask_name()
    class = ask_class()
    level = ask_level()

    map = %{
      name: name,
      class: class,
      level: level
    }

    IO.inspect(map, label: "Your character")
  end
end
