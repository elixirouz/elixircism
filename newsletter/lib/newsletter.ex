defmodule Newsletter do
  def read_emails(path) do
    File.read!(path)
    |> String.split()
  end

  def open_log(path) do
    File.open!(path, [:write])
  end

  def log_sent_email(pid, email) do
    IO.puts(pid, email)
  end

  def close_log(pid) do
    File.close(pid)
  end

  def send_newsletter(emails_path, log_path, send_fun) do
    log_file = open_log(log_path)

    Enum.each(
      read_emails(emails_path),
      fn email ->
        case send_fun.(email) do
          :ok ->
            log_sent_email(log_file, email)

          _ ->
            nil
        end
      end
    )

    close_log(log_file)
  end
end
