defmodule FileSniffer do
  @ext_map %{
    "bmp" => "image/bmp",
    "gif" => "image/gif",
    "jpg" => "image/jpg",
    "png" => "image/png",
    "exe" => "application/octet-stream"
  }
  def type_from_extension(extension) do
    @ext_map[extension]
  end

  def type_from_binary(file_binary) do
    case file_binary do
      <<255, 216, 255, _::binary>> ->
        @ext_map["jpg"]

      <<137, 80, 78, 71, 13, 10, 26, 10, _::binary>> ->
        @ext_map["png"]

      # 14 B header
      <<66, 77, 30, 0, 0, 0, 0, 0, 0, 0, 26, 0, 0, 0, _::binary>> ->
        @ext_map["bmp"]

      # 14 B header
      <<71, 73, 70, 56, 57, 97, 1, 0, 1, 0, 0, 0, 0, 59, _::binary>> ->
        @ext_map["gif"]

      # <<77, 90, 144, _::binary>> -> @ext_map["exe"] # for .exe files
      # 52 bytes
      <<127, 69, 76, 70, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 3, 0, 1, 0, 0, 0, 25, 64, 205,
        128, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 52, 0, 32, 0, 1, 0, 0, 0, 0, 0, 0, 0,
        _::binary>> ->
        @ext_map["exe"]

      _ ->
        nil
    end
  end

  def verify(file_binary, extension) do
    # or can use a list to validate un-allowed extensions
    if type_from_binary(file_binary) == type_from_extension(extension) and extension != "dat" do
      {:ok, type_from_extension(extension)}
    else
      {:error, "Warning, file format and file extension do not match."}
    end
  end
end
