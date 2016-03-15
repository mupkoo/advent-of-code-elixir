defmodule AdventOfCode.Day2 do
  def parse(input) do
    String.split(input, "\n")
    |> Enum.reduce(0, &parse_gift/2)
  end

  defp parse_gift("", acc) do
    acc
  end

  defp parse_gift(gift, acc) do
    [l, w, h] = gift
      |> String.strip
      |> String.split("x")
      |> Enum.map(&String.to_integer/1)
      |> calculate_side_areas
      |> Enum.sort

    acc + 2 * l + 2 * w + 2 * h + l
  end

  defp calculate_side_areas([l, w, h]) do
    [l * w, w * h, l * h]
  end
end
