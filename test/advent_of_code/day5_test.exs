defmodule AdventOfCodeDay5Test do
  use ExUnit.Case
  alias AdventOfCode.Day5

  test "it returns the number of nice children" do
    assert Day5.parse("""
      ugknbfddgicrmopn
      aaa
      jchzalrnumimnmhp
      haegwjzuvuyypxyu
      dvszwmarrgswjxmb
    """) == 2
  end

  test "checks if a child is nice or not" do
    assert Day5.nice?("ugknbfddgicrmopn") == true
    assert Day5.nice?("aaa")              == true
    assert Day5.nice?("jchzalrnumimnmhp") == false
    assert Day5.nice?("haegwjzuvuyypxyu") == false
    assert Day5.nice?("dvszwmarrgswjxmb") == false
  end
end
