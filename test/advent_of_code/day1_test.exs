defmodule AdventOfCodeDay1Test do
  use ExUnit.Case
  alias AdventOfCode.Day1

  test "returns 0 whenever the brackets are the same number" do
    assert Day1.parse("(())") == 0
    assert Day1.parse("()()") == 0
  end

  test "returns a positive number if the opening brackets are more" do
    assert Day1.parse("(((") == 3
    assert Day1.parse("(()(()(") == 3
    assert Day1.parse("))((((((") == 4
  end

  test "returns a negative number if the closing brackets are more" do
    assert Day1.parse("())") == -1
    assert Day1.parse("))(") == -1
    assert Day1.parse(")())())") == -3
  end
end
