defmodule AdventOfCodeDay6Test do
  use ExUnit.Case
  alias AdventOfCode.Day6

  @initial_grid %{
    {0, 0} => true,  {0, 1} => false, {0, 2} => false,
    {1, 0} => false, {1, 1} => false, {1, 2} => true,
    {2, 0} => true,  {2, 1} => true,  {2, 2} => false
  }

  test "#parse executes the passed instructions and returns the number of turned on lights" do
    instructions = """
      turn on 1,1 through 1,2
      toggle 0,2 through 1,2
      toggle 0,0 through 2,2
      turn off 1,1 through 2,1
    """

    assert Day6.parse(instructions, 3) == 6
  end

  test "#parse_line parses a given line to instructions" do
    assert Day6.parse_line("turn off 660,55 through 986,197") == {"off", {660, 55}, {986, 197}}
    assert Day6.parse_line("toggle 322,558 through 977,958") == {"toggle", {322, 558}, {977, 958}}
    assert Day6.parse_line("turn on 576,900 through 943,934") == {"on", {576, 900}, {943, 934}}
  end

  test "#parse_line work even with white spaces" do
    assert Day6.parse_line("  turn on 576,900 through 943,934  ") == {"on", {576, 900}, {943, 934}}
  end

  test "#execute turns on all the lights according the cordinates" do
    assert Day6.execute({"on", {1, 1}, {2, 2}}, @initial_grid) == %{
      {0, 0} => true,  {0, 1} => false, {0, 2} => false,
      {1, 0} => false, {1, 1} => true,  {1, 2} => true,
      {2, 0} => true,  {2, 1} => true,  {2, 2} => true
    }
  end

  test "#execute turns off all the lights according the cordinates" do
    assert Day6.execute({"off", {1, 1}, {2, 2}}, @initial_grid) == %{
      {0, 0} => true,  {0, 1} => false, {0, 2} => false,
      {1, 0} => false, {1, 1} => false, {1, 2} => false,
      {2, 0} => true,  {2, 1} => false, {2, 2} => false
    }
  end

  test "#execute toggle all the lights according the cordinates" do
    assert Day6.execute({"toggle", {1, 1}, {2, 2}}, @initial_grid) == %{
      {0, 0} => true,  {0, 1} => false, {0, 2} => false,
      {1, 0} => false, {1, 1} => true,  {1, 2} => false,
      {2, 0} => true,  {2, 1} => false, {2, 2} => true
    }
  end
end
