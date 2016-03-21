defmodule AdventOfCodeDay8Test do
  use ExUnit.Case
  alias AdventOfCode.Day8

  @input ~S{""
  "asd"
  "as\"d"
  "as\x27ss"
  "\"\\fdktlp"}

  test "#parse line returns the total difference between code and chars" do
    assert Day8.parse(@input) == 16
  end

  test "#parse_line returns the difference between code and chars" do
    assert Day8.parse_line(~S{""}) == 2
    assert Day8.parse_line(~S{"asd"}) == 2
    assert Day8.parse_line(~S{"as\"d"}) == 3
    assert Day8.parse_line(~S{"as\x27ss"}) == 5
    assert Day8.parse_line(~S{"\"\\fdktlp"}) == 4
  end
end
