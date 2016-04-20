defmodule AdventOfCode.Day17 do
  def parse(input, liters \\ 150) do
    containers = normalize(input)

    1..length(containers)
    |> Enum.reduce({0, containers, liters}, &reducer/2)
    |> elem(0)
  end

  defp reducer(n, {sum, containers, liters}) do
    inner_sum = containers
      |> combinations(n)
      |> Enum.reduce(0, fn (list, sum) ->
        if Enum.sum(list) == liters, do: sum + 1, else: sum
      end)

    {sum + inner_sum, containers, liters}
  end

  defp normalize(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&line_to_integer/1)
  end

  defp line_to_integer(line) do
    line
    |> String.strip
    |> String.to_integer
  end

  def combinations(_, 0), do: [[]]
  def combinations([], _), do: []
  def combinations([x|xs], n) do
    (for y <- combinations(xs, n - 1), do: [x|y]) ++ combinations(xs, n)
  end
end
