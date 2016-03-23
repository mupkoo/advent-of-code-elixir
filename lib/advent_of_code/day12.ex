defmodule AdventOfCode.Day12 do
  def parse(input) do
    Regex.scan(~r/(-?\d+)/, input)
    |> Enum.reduce(0, fn ([number, _], sum) ->
      sum + String.to_integer(number)
    end)
  end
end
