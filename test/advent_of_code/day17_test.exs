defmodule AdventOfCodeDay17Test do
  use ExUnit.Case
  alias AdventOfCode.Day17

  test "#parse returns the number of combination that can be used to store input" do
    input = """
      20
      15
      10
      5
      5
    """

    assert Day17.parse(input, 25) == 4
  end
end
