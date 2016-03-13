defmodule Mix.Tasks.AdventOfCode.Day1 do
  use Mix.Task

  @shortdoc "Solution to day one"

  def run([input]) do
    IO.puts AdventOfCode.Day1.parse(input)
  end
end
