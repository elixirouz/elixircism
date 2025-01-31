defmodule Secrets do
  @doc """
  ```
  fn arg -> arg + secret end
  ```
  can be written in shorthand as
  ```
  &(&1 + secret)
  """
  def secret_add(secret), do: &(&1 + secret)

  def secret_subtract(secret), do: &(&1 - secret)

  def secret_multiply(secret), do: &(&1 * secret)

  def secret_divide(secret), do: &div(&1, secret)

  def secret_and(secret), do: &Bitwise.band(&1, secret)

  def secret_xor(secret), do: &Bitwise.bxor(&1, secret)

  @doc """
  ```
  fn arg -> secret_function2.(secret_function1.(arg)) end
  ```
  the same shorthand technique can be applied here to make the implementation more concise
  ```
  &(secret_function2.(secret_function1(&1)))
  ```
  """
  def secret_combine(secret_function1, secret_function2),
    do: &secret_function2.(secret_function1.(&1))
end
