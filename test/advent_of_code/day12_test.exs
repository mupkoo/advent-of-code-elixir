defmodule AdventOfCodeDay12Test do
  use ExUnit.Case
  alias AdventOfCode.Day12

  test "#parse returns the sum of all the elements in an array" do
    assert Day12.parse(~s([1,2,3])) == 6
  end

  test "#parse returns the sum of the values of an object" do
    assert Day12.parse(~s({"a":2,"b":4})) == 6
  end

  test "#parse returns the sum of nested arrays" do
    assert Day12.parse(~s([[[3],-1]])) == 2
  end

  test "#parse returns the sum of nested objects" do
    assert Day12.parse(~s({"a":{"b":4},"c":-1})) == 3
  end

  test "#parse handles mixed objects and arrays" do
    assert Day12.parse(~s({"a":[-1,1]})) == 0
    assert Day12.parse(~s([-1,{"a":1}])) == 0
  end

  test "#parse returns 0 for empty array" do
    assert Day12.parse(~s([])) == 0
  end

  test "#parse returns 0 for empty object" do
    assert Day12.parse(~s({})) == 0
  end
end
