defmodule AdventOfCodeDay16Test do
  use ExUnit.Case
  alias AdventOfCode.Day16

  test "#parse returns the aunt number based on match" do
    assert Day16.parse("""
      Sue 1: cars: 9, akitas: 3, goldfish: 0
      Sue 2: akitas: 9, children: 3, samoyeds: 9
      Sue 3: trees: 3, cars: 2, children: 3
      Sue 4: trees: 4, vizslas: 4, goldfish: 9
    """) == "3"
  end

  test "#parse_line parses the given line" do
    line = "Sue 2: akitas: 9, children: 3, samoyeds: 9"
    result = {"2", [{"akitas", "9"}, {"children", "3"}, {"samoyeds", "9"}]}

    assert Day16.parse_line(line) == result
  end
end
