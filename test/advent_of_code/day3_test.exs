defmodule AdventOfCodeDay3Test do
  use ExUnit.Case
  alias AdventOfCode.Day3

  test "it returns the number of houses Santa delivered a present" do
    assert Day3.parse(">") == 2
    assert Day3.parse("^>v<") == 4
    assert Day3.parse("^v^v^v^v^v") == 2
  end
end
