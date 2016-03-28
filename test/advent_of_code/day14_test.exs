defmodule AdventOfCodeDay14Test do
  use ExUnit.Case
  alias AdventOfCode.Day14

  @input """
  Comet can fly 14 km/s for 10 seconds, but then must rest for 127 seconds.
  Dancer can fly 16 km/s for 11 seconds, but then must rest for 162 seconds.
  """

  test "#parse returns the longest distance for the given time" do
    assert Day14.parse(@input, 1000) == 1120
  end
end
