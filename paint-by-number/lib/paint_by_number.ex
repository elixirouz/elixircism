defmodule PaintByNumber do
  def palette_bit_size(color_count, bits \\ 1)

  def palette_bit_size(color_count, bits) do
    if 2 ** bits >= color_count do
      bits
    else
      palette_bit_size(color_count, bits + 1)
    end
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<
      # segment 1
      0::2,
      # segment 2
      1::2,
      # segment 3
      2::2,
      # segment 4
      3::2
    >>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    <<pixel_color_index::size(palette_bit_size(color_count)), picture::bitstring>>
  end

  def get_first_pixel(picture, color_count) do
    case picture do
      <<>> ->
        nil

      _ ->
        bitsize = palette_bit_size(color_count)
        <<first_pixel::size(bitsize), _::bitstring>> = picture
        first_pixel
    end
  end

  def drop_first_pixel(picture, color_count) do
    case picture do
      <<>> ->
        <<>>

      _ ->
        bitsize = palette_bit_size(color_count)
        <<_::size(bitsize), rem_pixels::bitstring>> = picture
        rem_pixels
    end
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
