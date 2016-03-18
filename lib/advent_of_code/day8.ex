defmodule AdventOfCode.Day8 do
  def parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.strip/1)
    |> Enum.reduce(0, &(parse_line(&1) + &2))
  end

  def parse_line(line) do
    String.length(line) - char_length(String.to_char_list(line), -2)
  end

  defp char_length(line, acc) do
    case line do
      []                     -> acc
      [_]                    -> acc + 1
      [?\\, ?x, _, _ | rest] -> char_length(rest, acc + 1)
      [?\\, _ | rest]        -> char_length(rest, acc + 1)
      [_ | rest]             -> char_length(rest, acc + 1)
    end
  end
end
