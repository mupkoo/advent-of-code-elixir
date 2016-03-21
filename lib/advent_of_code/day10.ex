defmodule AdventOfCode.Day10 do
  def parse(input, times \\ 40) do
    input
    |> String.graphemes
    |> process([], times)
    |> Enum.count
  end

  def process(current, _, 0), do: current

  def process(current, next, times) do
    case current do
      [n, n, n, n, n, n, n, n, n | rest] -> process(rest, [n, "9" | next], times)
      [n, n, n, n, n, n, n, n | rest] -> process(rest, [n, "8" | next], times)
      [n, n, n, n, n, n, n | rest] -> process(rest, [n, "7" | next], times)
      [n, n, n, n, n, n | rest] -> process(rest, [n, "6" | next], times)
      [n, n, n, n, n | rest] -> process(rest, [n, "5" | next], times)
      [n, n, n, n | rest] -> process(rest, [n, "4" | next], times)
      [n, n, n | rest] -> process(rest, [n, "3" | next], times)
      [n, n | rest] -> process(rest, [n, "2" | next], times)
      [n | rest] -> process(rest, [n, "1" | next], times)
      [] -> process(Enum.reverse(next), [], times - 1)
    end
  end
end
