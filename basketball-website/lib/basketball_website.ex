defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    path_parts = String.split(path, ".")
    foreach(path_parts, data)
  end

  defp foreach([], acc), do: acc

  defp foreach([head | tail], acc) do
    if acc |> is_map() do
      foreach(tail, acc[head])
    else
      nil
    end
  end

  def get_in_path(data, path) do
    path_parts = String.split(path, ".")
    Kernel.get_in(data, path_parts)
  end
end
