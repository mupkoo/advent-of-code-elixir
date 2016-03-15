defmodule AdventOfCode.Day3 do
  def parse(input) do
    [{0, 0}]
    |> parse_moves(input)
    |> Enum.uniq
    |> Enum.count
  end

  defp parse_moves(acc, input) do
    [{x, y} | _] = acc

    case input do
      ">" <> rest ->
        parse_moves([{x + 1, y} | acc], rest)
      "<" <> rest ->
        parse_moves([{x - 1, y} | acc], rest)
      "^" <> rest ->
        parse_moves([{x, y - 1} | acc], rest)
      "v" <> rest ->
        parse_moves([{x, y + 1} | acc], rest)
      _ ->
        acc
    end
  end
end
