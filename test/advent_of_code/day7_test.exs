defmodule AdventOfCodeDay7Test do
  use ExUnit.Case
  alias AdventOfCode.Day7

  @instructions """
    123 -> x
    456 -> y
    x AND y -> d
    x OR y -> e
    x LSHIFT 2 -> f
    y RSHIFT 2 -> g
    x -> w
    NOT x -> h
    NOT y -> i
  """

  test "#parse returns the value of the specified wire" do
    assert Day7.parse(@instructions, "g") == 114
    assert Day7.parse(@instructions, "x") == 123
    assert Day7.parse(@instructions, "w") == 123
  end

  test "#parse_line parses the given line into instructions" do
    assert Day7.parse_line("123 -> x") == { "x", { 123 } }
    assert Day7.parse_line("23 -> ab") == { "ab", { 23 } }
    assert Day7.parse_line("x AND y -> z") == { "z", { "x", "AND", "y" } }
    assert Day7.parse_line("x LSHIFT 2 -> f") == { "f", { "x", "LSHIFT", 2 } }
    assert Day7.parse_line("NOT ab -> xz") == { "xz", { "NOT", "ab" } }
    assert Day7.parse_line("lx -> a") == { "a", { "lx" } }
  end
end
