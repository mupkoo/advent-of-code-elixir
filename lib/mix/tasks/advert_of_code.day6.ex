defmodule Mix.Tasks.AdventOfCode.Day6 do
  use Mix.Task

  @shortdoc "Solution to day six"

  def run([input]) do
    IO.puts AdventOfCode.Day6.parse(input)
  end
end
