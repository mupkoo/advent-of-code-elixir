defmodule AdventOfCode.Day6 do
  def parse(input, size \\ 999) do
    grid = generate_grid(size)

    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
    |> Enum.reduce(grid, &execute/2)
    |> Enum.count(&(elem(&1, 1)))
  end

  def execute({"on", {x1, y1}, {x2, y2}}, grid) do
    for x <- x1..x2, y <- y1..y2, into: grid, do: { {x, y}, true }
  end

  def execute({"off", {x1, y1}, {x2, y2}}, grid) do
    for x <- x1..x2, y <- y1..y2, into: grid, do: { {x, y}, false }
  end

  def execute({"toggle", {x1, y1}, {x2, y2}}, grid) do
    for x <- x1..x2, y <- y1..y2, into: grid, do: { {x, y}, !Map.get(grid, {x, y}) }
  end

  def parse_line(line) do
    line
    |> String.strip
    |> String.replace("turn ", "")
    |> String.replace("through ", "")
    |> String.split(" ")
    |> List.update_at(1, &parse_cordinates/1)
    |> List.update_at(2, &parse_cordinates/1)
    |> List.to_tuple
  end

  defp parse_cordinates(cordinates) do
    cordinates
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
    |> List.to_tuple
  end

  defp generate_grid(size) do
    for x <- 0..size, y <- 0..size, into: %{}, do: { {x, y}, false }
  end
end
