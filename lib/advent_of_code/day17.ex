defmodule AdventOfCode.Day17 do
  def parse(input, liters \\ 150) do
    containers = normalize(input)

    containers
    |> indexes
    |> permutations
    |> Stream.map(fn (indexes) -> sum(indexes, containers, liters) end)
    |> Stream.filter(fn ({sum, _}) -> sum == liters end)
    |> Stream.map(fn ({sum, indexes}) -> {sum, Enum.sort(indexes)} end)
    |> Stream.uniq
    |> Enum.to_list
    |> length
  end

  def sum(indexes, containers, liters) do
    Enum.reduce(indexes, {0, []}, fn (index, {sum, inner_indexes}) ->
      case sum < liters do
        true -> {sum + Enum.at(containers, index), [index | inner_indexes]}
        false -> {sum, inner_indexes}
      end
    end)
  end

  def indexes(list) do
    count = length(list) - 1
    0..count |> Enum.to_list
  end

  def permutations(list) do
    list
    |> Enum.sort
    |> Stream.unfold(fn
      [] -> nil
      p ->
        {p, next_permutation(p)}
    end)
  end

  defp next_permutation(permutation) do
    if permutation == permutation |> Enum.sort |> Enum.reverse do
      []
    else
      permutation
      |> split
      |> heal
    end
  end

  defp split(permutation) do
    permutation
    |> Enum.reverse
    |> Enum.reduce({0, false, [], []}, fn(x, {prev, split, first, last}) ->
      case split do
        false -> {x, x < prev, first, [x|last]}
        true -> {x, true, [x|first], last}
      end
    end)
    |> fn({_, _,first, last}) -> {first, last} end.()
  end

  defp heal({first, [h|_] = last}) do
    next = last |> Enum.filter(&(&1 > h)) |> Enum.min
    rest = last -- [next] |> Enum.sort
    first ++ [next] ++ rest
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
end
