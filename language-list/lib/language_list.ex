defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  @doc """
  Instead of taking the argument as list and extracting `tail` from it using the following pattern matching,
  ```
  [_head | tail] = list
  ```
  One can directly do that in the function argument itself to reduce the lines of code.
  """
  def remove([_head | tail]) do
    tail
    # tl(list) can be used instead of pattern matching
  end

  @doc """
  Another way to return the first element is to use the `first` function in the `List` module
  ```
  iex(1)> ll = []
  []
  iex(2)> ll = ["Clojure"|ll]
  ["Clojure"]
  iex(3)> ll = ["Haskell"|ll]
  ["Haskell", "Clojure"]
  iex(4)> ll = ["Java"|ll]
  ["Java", "Haskell", "Clojure"]
  iex(5)> List.first(ll)
  "Java"
  """
  def first([head | _tail]) do
    head
    # hd(list) can be used instead of pattern matching
  end

  def count(list) do
    length(list)
  end

  def functional_list?(list) do
    "Elixir" in list
  end
end
