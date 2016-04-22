defmodule AdventOfCodeDay19Test do
  use ExUnit.Case
  alias AdventOfCode.Day19

  test "#parse returns the unique number of replacements" do
    assert Day19.parse("""
    H => HO
    H => OH
    O => HH

    HOH
    """) ==  4
  end

  test "#parse returns the unique number of replacements even with more complex input" do
    assert Day19.parse("""
    H => HH
    Ho => Hoo
    o => H
    o => oo

    HoHoHHo
    """) ==  9
  end

  test "#parse_input destructs the given input to replacements and initial value" do
    instuctions = [{"H", "HO"}, {"H", "OH"}, {"O", "HH"}]
    initial = ~w{H O H}

    assert Day19.parse_input("""
    H => HO
    H => OH
    O => HH

    HOH
    """) == {instuctions, initial}
  end
end
