defmodule Mix.Tasks.AdventOfCode.Day5 do
  use Mix.Task

  @shortdoc "Solution to day five"

  def run([input]) do
    IO.puts AdventOfCode.Day5.parse(input)
  end
end
