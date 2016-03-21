defmodule AdventOfCodeDay2Test do
  use ExUnit.Case
  alias AdventOfCode.Day2

  test "it returns the right amount of square feet of wrapping paper" do
    assert Day2.parse("2x3x4") == 58
    assert Day2.parse("4x3x2") == 58
    assert Day2.parse("1x1x10") == 43
  end

  test "it works with multi-line input" do
    assert Day2.parse("""
      2x3x4
      1x1x10
    """) == 101
  end
end
