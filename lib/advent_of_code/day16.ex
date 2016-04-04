defmodule AdventOfCode.Day16 do
  @ticket %{
    "children"    => "3",
    "cats"        => "7",
    "samoyeds"    => "2",
    "pomeranians" => "3",
    "akitas"      => "0",
    "vizslas"     => "0",
    "goldfish"    => "5",
    "trees"       => "3",
    "cars"        => "2",
    "perfumes"    => "1"
  }

  def parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
    |> Enum.filter(&check_ticket/1)
    |> List.first
    |> elem(0)
  end

  def check_ticket({_, notes}) do
    Enum.all?(notes, fn ({key, value}) ->
      Map.get(@ticket, key, value) == value
    end)
  end

  def parse_line(line) do
    ["Sue", aunt, key1, value1, key2, value2, key3, value3] = line
      |> String.replace(~r/[:,]/, "")
      |> String.split(" ", trim: true)

    {aunt, [{key1, value1}, {key2, value2}, {key3, value3}]}
  end
end
