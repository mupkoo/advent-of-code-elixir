defmodule AdventOfCodeDay10Test do
  use ExUnit.Case
  alias AdventOfCode.Day10

  test "#parse returns the input processed the given amount" do
    assert Day10.parse("1", 5) == 6
  end
end
