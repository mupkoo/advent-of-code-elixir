defmodule Mix.Tasks.AdventOfCode.Day4 do
  use Mix.Task

  @shortdoc "Solution to day four"

  def run([input]) do
    IO.puts AdventOfCode.Day4.parse(input)
  end
end
