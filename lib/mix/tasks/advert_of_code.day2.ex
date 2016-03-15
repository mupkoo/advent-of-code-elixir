defmodule Mix.Tasks.AdventOfCode.Day2 do
  use Mix.Task

  @shortdoc "Solution to day two"

  def run([input]) do
    IO.puts AdventOfCode.Day2.parse(input)
  end
end
