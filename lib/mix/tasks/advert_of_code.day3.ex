defmodule Mix.Tasks.AdventOfCode.Day3 do
  use Mix.Task

  @shortdoc "Solution to day three"

  def run([input]) do
    IO.puts AdventOfCode.Day3.parse(input)
  end
end
