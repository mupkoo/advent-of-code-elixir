defmodule AdventOfCodeDay9Test do
  use ExUnit.Case
  alias AdventOfCode.Day9

  test "#parse returns the shortest travel distance" do
    assert Day9.parse("""
    London to Dublin = 464
    London to Belfast = 518
    Dublin to Belfast = 141
    """) == 605

    assert Day9.parse("""
    Dublin to Belfast = 141
    London to Belfast = 518
    London to Dublin = 464
    London to Tristram = 65
    Dublin to Tristram = 120
    Belfast to Tristram = 16
    """) == 222
  end
end
