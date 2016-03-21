defmodule AdventOfCode.Day9 do
  def parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
    |> Enum.reduce(%{}, &normalize/2)
    |> Enum.map(&sort/1)
    |> Enum.reduce(%{total: 0, visited: []}, &shortest_distance/2)
    |> Map.get(:total)
  end

  defp shortest_distance({ city, dists }, acc) do
    acc
    |> Map.update!(:total, &(&1 + distance_for(dists, acc.visited)))
    |> Map.update!(:visited, &([city | &1]))
  end

  defp distance_for([], _), do: 0

  defp distance_for([{ dist, city } | tail], visited) do
    case Enum.member?(visited, city) do
      true -> distance_for(tail, visited)
      false -> dist
    end
  end

  defp parse_line(line) do
    Regex.named_captures(~r/(?<from>\w+) to (?<to>\w+) = (?<dist>\d+)/, line)
    |> Map.update!("dist", &String.to_integer/1)
  end

  defp normalize(line, map) do
    map
    |> Map.update(line["from"], [{ line["dist"], line["to"] }], &([{ line["dist"], line["to"] } | &1]))
    |> Map.update(line["to"], [{ line["dist"], line["from"] }], &([{ line["dist"], line["from"] } | &1]))
  end

  defp sort({ city, dists }) do
    { city, Enum.sort(dists, fn ({ left, _ }, { right, _ }) -> left < right end) }
  end
end
