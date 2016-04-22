defmodule AdventOfCode.Day18 do
  import Map, only: [get: 3, get: 2]

  def parse(input, steps \\ 100) do
    grid = parse_input(input)

    1..steps
    |> Enum.reduce(grid, fn (_, before) ->
      Enum.reduce(before, %{}, fn ({key, value}, acc) ->
        Map.put(acc, key, resolve_next({key, value}, before))
      end)
    end)
    |> Enum.reduce(0, fn ({_, value}, sum) -> sum + value end)
  end

  def resolve_next({{x, y}, value}, grid) do
    sum = get(grid, {x - 1, y - 1}, 0) + get(grid, {x, y - 1}, 0) + get(grid, {x + 1, y - 1}, 0) +
          get(grid, {x - 1, y}, 0)     +           0              + get(grid, {x + 1, y}, 0) +
          get(grid, {x - 1, y + 1}, 0) + get(grid, {x, y + 1}, 0) + get(grid, {x + 1, y + 1}, 0)

    case {value, sum} do
      {0, 3} -> 1
      {1, 2} -> 1
      {1, 3} -> 1
      _      -> 0
    end
  end

  def parse_input(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.with_index
    |> Enum.reduce(%{}, fn ({line, row}, map) ->
      line
      |> String.graphemes
      |> Enum.with_index
      |> Enum.reduce(map, fn
        ({".", col}, map) -> Map.put(map, {row, col}, 0)
        ({"#", col}, map) -> Map.put(map, {row, col}, 1)
      end)
    end)
  end
end
