defmodule Mix.Tasks.AdventOfCode.Day do
  use Mix.Task

  @shortdoc "Execute the solution for a specific day"

  def run(["one", input]),   do: IO.puts AdventOfCode.Day1.parse(input)
  def run(["two", input]),   do: IO.puts AdventOfCode.Day2.parse(input)
  def run(["three", input]), do: IO.puts AdventOfCode.Day3.parse(input)
  def run(["four", input]),  do: IO.puts AdventOfCode.Day4.parse(input)
  def run(["five", input]),  do: IO.puts AdventOfCode.Day5.parse(input)
  def run(["six", input]),   do: IO.puts AdventOfCode.Day6.parse(input)
  def run(["seven", input]), do: IO.puts AdventOfCode.Day7.parse(input)
end
