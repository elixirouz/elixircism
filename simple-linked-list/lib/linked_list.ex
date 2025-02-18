defmodule LinkedList do
  @moduledoc """
  A simple implementation of a singly linked list with tail-call optimized (TCO) functions.

  This module provides basic operations for working with a linked list, including creation, insertion, counting, and conversion to/from standard lists. All functions are tail-call optimized to ensure efficient recursion.
  """

  @opaque t :: {any(), t()} | {}

  @doc """
  Construct a new LinkedList
  """
  @spec new() :: t
  def new() do
    {}
  end

  @doc """
  Push an item onto a LinkedList
  """
  @spec push(t, any()) :: t
  def push(list, elem) do
    {elem, list}
  end

  @doc """
  Counts the number of elements in a LinkedList
  """
  @spec count(t) :: non_neg_integer()
  def count(list) do
    do_count(list, 0)
  end

  # TCO base case
  defp do_count({}, count), do: count

  # TCO function for counting items in custom list
  defp do_count({_head, tail}, count) do
    do_count(tail, count + 1)
  end

  def empty?({}), do: true

  @doc """
  Determine if a LinkedList is empty
  """
  @spec empty?(t) :: boolean()
  def empty?({_, _}) do
    false
  end

  @doc """
  Get the value of a head of the LinkedList
  """
  @spec peek(t) :: {:ok, any()} | {:error, :empty_list}
  def peek({head, _tail}) do
    {:ok, head}
  end

  def peek({}), do: {:error, :empty_list}

  @doc """
  Get tail of a LinkedList
  """
  @spec tail(t) :: {:ok, t} | {:error, :empty_list}
  def tail({_head, tail}) do
    {:ok, tail}
  end

  def tail({}), do: {:error, :empty_list}

  @doc """
  Remove the head from a LinkedList
  """
  @spec pop(t) :: {:ok, any(), t} | {:error, :empty_list}
  def pop({head, tail}) do
    {:ok, head, tail}
  end

  def pop({}), do: {:error, :empty_list}

  @doc """
  Construct a LinkedList from a stdlib List
  """
  @spec from_list(list()) :: t
  def from_list(list) do
    reverse(do_from_list(list, {}))
  end

  defp do_from_list([], acc), do: acc

  defp do_from_list([head | tail], acc) do
    do_from_list(tail, {head, acc})
  end

  @doc """
  Construct a stdlib List LinkedList from a LinkedList
  """
  @spec to_list(t) :: list()
  def to_list(list) do
    do_to_list(reverse(list), [])
  end

  defp do_to_list({}, acc), do: acc

  defp do_to_list({head, tail}, acc) do
    do_to_list(tail, [head | acc])
  end

  @doc """
  Reverse a LinkedList (TCO function)
  """
  @spec reverse(t) :: t
  def reverse(list) do
    do_reverse(list, {})
  end

  defp do_reverse({}, acc), do: acc

  defp do_reverse({head, tail}, acc) do
    do_reverse(tail, {head, acc})
  end
end
