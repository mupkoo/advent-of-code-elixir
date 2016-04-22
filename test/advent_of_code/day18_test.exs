defmodule AdventOfCodeDay18Test do
  use ExUnit.Case
  alias AdventOfCode.Day18

  test "#parse returns the number of running lights after given steps" do
    initial_state = """
    .#.#.#
    ...##.
    #....#
    ..#...
    #.#..#
    ####..
    """

    assert Day18.parse(initial_state, 4) == 4
  end
end
