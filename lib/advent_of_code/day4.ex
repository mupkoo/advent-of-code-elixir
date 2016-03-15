defmodule AdventOfCode.Day4 do
  def parse(input) do
    search(0, input)
  end

  defp search(acc, input) do
    case md5("#{input}#{acc}") do
      "00000" <> _ -> acc
      _ -> search(acc + 1, input)
    end
  end

  defp md5(value) do
    :crypto.hash(:md5, value) |> Base.encode16
  end
end
