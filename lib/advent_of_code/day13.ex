defmodule AdventOfCode.Day13 do
  def parse(input) do
    {people, data} = input
      |> String.split("\n", trim: true)
      |> Enum.reduce({[], %{}}, &parse_line/2)

    people
    |> permute
    |> Enum.map(&(happiness(&1, hd(&1), data)))
    |> Enum.max
  end

  def happiness([last], first, data) do
    Map.get(data, {first, last}, 0) + Map.get(data, {last, first}, 0)
  end

  def happiness([p1, p2 | rest], first, data) do
    Map.get(data, {p1, p2}, 0) + Map.get(data, {p2, p1}, 0) + happiness([p2 | rest], first, data)
  end

  def permute([]), do: [[]]
  def permute(list) do
    for x <- list, y <- permute(list -- [x]), do: [x|y]
  end

  def parse_line(line, {people, data}) do
    [p1, "would", gain, amount, "happiness", "units", "by", "sitting", "next", "to", p2] =
      String.split(line, " ", trim: true)

    p2 = String.rstrip(p2, ?.)

    {
      Enum.uniq([p1, p2 | people]),
      Map.put(data, {p1, p2}, gain_or_lose(gain) * String.to_integer(amount))
    }
  end

  defp gain_or_lose(type) do
    case type do
      "gain" -> 1
      "lose" -> -1
    end
  end
end
