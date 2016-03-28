defmodule AdventOfCodeDay13Test do
  use ExUnit.Case
  alias AdventOfCode.Day13

  @input """
  Alice would gain 54 happiness units by sitting next to Bob.
  Alice would lose 79 happiness units by sitting next to Carol.
  Alice would lose 2 happiness units by sitting next to David.
  Bob would gain 83 happiness units by sitting next to Alice.
  Bob would lose 7 happiness units by sitting next to Carol.
  Bob would lose 63 happiness units by sitting next to David.
  Carol would lose 62 happiness units by sitting next to Alice.
  Carol would gain 60 happiness units by sitting next to Bob.
  Carol would gain 55 happiness units by sitting next to David.
  David would gain 46 happiness units by sitting next to Alice.
  David would lose 7 happiness units by sitting next to Bob.
  David would gain 41 happiness units by sitting next to Carol.
  """

  test "#parse returns the optimal sum of happiness" do
    assert Day13.parse(@input) == 330
  end

  test "#parse_line assigns positive happiness value for 'gain'" do
    line = "Alice would gain 54 happiness units by sitting next to Bob."
    assert Day13.parse_line(line, {[], %{}}) == {["Alice", "Bob"], %{{"Alice", "Bob"} => 54}}
  end

  test "#parse_line assigns negative happiness value for 'gain'" do
    line = "Alice would lose 2 happiness units by sitting next to David."
    assert Day13.parse_line(line, {[], %{}}) == {["Alice", "David"], %{{"Alice", "David"} => -2}}
  end
end
