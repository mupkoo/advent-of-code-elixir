defmodule AdventOfCodeDay9Test do
  use ExUnit.Case
  alias AdventOfCode.Day9

  @input """
  London to Dublin = 464
  London to Belfast = 518
  Dublin to Belfast = 141
  """

  test "#parse returns the shortest travel distance" do
    assert Day9.parse(@input) == 605
  end
end
