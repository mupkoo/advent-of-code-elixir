defmodule AdventOfCodeDay11Test do
  use ExUnit.Case
  alias AdventOfCode.Day11

  test "#parse returns the next password for the given one" do
    assert Day11.parse("abcdefgh") == "abcdffaa"
    assert Day11.parse("abcdffaa") == "abcdffbb"
  end

  test "#increment increments the given list of chars" do
    assert Day11.increment(["a", "b"]) == (["b", "b"])
    assert Day11.increment(["z", "x"]) == (["a", "y"])
    assert Day11.increment(["z", "z", "a"]) == (["a", "a", "b"])
  end

  test "#check_forbidden succeeds if there are no forbidden chars" do
    assert Day11.check_forbidden({ true, ~w{a b c} }) == { true, ~w{a b c} }
  end

  test "#check_forbidden fails if there is an 'o' char" do
    assert Day11.check_forbidden({ true, ~w{a b o} }) == { false, ~w{a b o} }
  end

  test "#check_forbidden fails if there is an 'l' char" do
    assert Day11.check_forbidden({ true, ~w{l b c} }) == { false, ~w{l b c} }
  end

  test "#check_forbidden fails if there is an 'i' char" do
    assert Day11.check_forbidden({ true, ~w{a i c} }) == { false, ~w{a i c} }
  end

  test "#check_forbidden fails if there are couple of forbidden chars" do
    assert Day11.check_forbidden({ true, ~w{a i i} }) == { false, ~w{a i i} }
  end

  test "#check_duplicates succeeds if there are two or more different duplicates" do
    assert Day11.check_duplicates({ true, ~w{a a b c c} }) == { true, ~w{a a b c c} }
    assert Day11.check_duplicates({ true, ~w{w c c b b f f} }) == { true, ~w{w c c b b f f} }
  end

  test "#check_duplicates fails if there are no duplicates" do
    assert Day11.check_duplicates({ true, ~w{a b c d e f g} }) == { false, ~w{a b c d e f g} }
  end

  test "#check_duplicates fails if there are less than two duplicates" do
    assert Day11.check_duplicates({ true, ~w{a b b g} }) == { false, ~w{a b b g} }
  end

  test "#check_duplicates fails if there are less than two different duplicates" do
    assert Day11.check_duplicates({ true, ~w{a b b g b b} }) == { false, ~w{a b b g b b} }
  end

  test "#check_sequence succeeds if there are three or more letters in a sequence" do
    assert Day11.check_sequence({ true, ~w{x w v d a} }) == { true, ~w{x w v d a} }
    assert Day11.check_sequence({ true, ~w{m d c b a} }) == { true, ~w{m d c b a} }
  end

  test "#check_sequence fails if there are no letters in sequence" do
    assert Day11.check_sequence({ true, ~w{l k d a} }) == { false, ~w{l k d a} }
    assert Day11.check_sequence({ true, ~w{m f c b} }) == { false, ~w{m f c b} }
  end
end
