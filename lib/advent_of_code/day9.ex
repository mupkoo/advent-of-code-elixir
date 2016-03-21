defmodule AdventOfCode.Day9 do
  def parse(input) do
    dests = parse_dests(input)
    cities = parse_cities(dests)

    distance(dests, Enum.count(cities) - 1, 0, cities)
  end

  defp distance(_, 0, sum, _), do: sum

  defp distance([{ dist, from, to } | rest], iteration, sum, visited) do
    if visited[from] < 2 && visited[to] < 2 do
      visited = visited
        |> Map.update(from, 1, &(&1 + 1))
        |> Map.update(to, 1, &(&1 + 1))

      distance(rest, iteration - 1, sum + dist, visited)
    else
      distance(rest, iteration, sum, visited)
    end
  end

  def parse_dests(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
    |> Enum.sort(&(elem(&1, 0) < elem(&2, 0)))
  end

  defp parse_line(line) do
    [from, "to", to, "=", dist] = String.split(line, " ")
    { String.to_integer(dist), from, to }
  end

  defp parse_cities(dests) do
    dests
    |> Enum.reduce([], &([elem(&1, 1), elem(&1, 2) | &2]))
    |> Enum.uniq
    |> Enum.reduce(%{}, &(Map.put(&2, &1, 0)))
  end
end
