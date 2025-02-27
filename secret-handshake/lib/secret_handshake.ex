defmodule SecretHandshake do
  @actions %{
    1 => "wink",
    2 => "double blink",
    3 => "close your eyes",
    4 => "jump",
    5 => "rev"
  }

  def commands(0), do: []

  def commands(code) when code > 31, do: []

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    Integer.digits(code, 2)
    |> Enum.reverse()
    |> conv_actions(1, [])
  end

  defp conv_actions([], index, acc) do
    cond do
      hd(acc) == "rev" and index == 6 -> tl(acc)
      length(acc) == 1 -> acc
      true -> Enum.reverse(acc)
    end
  end

  defp conv_actions([head | tail], index, acc) do
    if head == 1 do
      conv_actions(tail, index + 1, [@actions[index] | acc])
    else
      conv_actions(tail, index + 1, acc)
    end
  end
end
