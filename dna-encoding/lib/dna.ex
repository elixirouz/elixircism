defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?\s -> 0
      ?A -> 1
      ?C -> 2
      ?G -> 4
      ?T -> 8
      _ -> {:error, "unknown code point"}
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0 -> ?\s
      1 -> ?A
      2 -> ?C
      4 -> ?G
      8 -> ?T
      _ -> {:error, "unknown encoded code"}
    end
  end

  def encode([]), do: <<>>

  def encode(dna_charlist) do
    do_encode(dna_charlist, <<>>)
  end

  defp do_encode([], acc), do: acc

  defp do_encode([head | tail], acc) do
    do_encode(tail, <<acc::bitstring, encode_nucleotide(head)::4>>)
  end

  def decode(<<>>), do: []

  def decode(encoded_dna) do
    do_decode(encoded_dna, [])
  end

  defp do_decode(<<>>, acc), do: reverse_list(acc, [])

  defp do_decode(<<head::4, rest::bitstring>>, acc) do
    do_decode(rest, [decode_nucleotide(head) | acc])
  end

  defp reverse_list([], acc), do: acc

  defp reverse_list([head | tail], acc) do
    reverse_list(tail, [head | acc])
  end
end
