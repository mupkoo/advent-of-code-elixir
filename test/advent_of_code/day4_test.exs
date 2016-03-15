defmodule AdventOfCodeDay4Test do
  use ExUnit.Case
  alias AdventOfCode.Day4

  test "it returns the lowest positive number which generates hash with 5 leading zeros" do
    assert Day4.parse("abcdef") == 609043
    assert Day4.parse("pqrstuv") == 1048970
  end
end
