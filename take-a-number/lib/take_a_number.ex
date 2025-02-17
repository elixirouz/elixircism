defmodule TakeANumber do
  defp loop(state) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, state)
        loop(state)

      {:take_a_number, sender_pid} ->
        send(sender_pid, state + 1)
        loop(state + 1)

      :stop ->
        :ok

      _ ->
        loop(state)
    end
  end

  def start, do: spawn(fn -> loop(0) end)
end
