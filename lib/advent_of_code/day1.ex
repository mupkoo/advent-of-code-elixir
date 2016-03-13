defmodule AdventOfCode.Day1 do
  def parse(input) do
    resolve_floor(0, input)
  end

  defp resolve_floor(acc, ""),          do: acc
  defp resolve_floor(acc, "(" <> rest), do: resolve_floor(acc + 1, rest)
  defp resolve_floor(acc, ")" <> rest), do: resolve_floor(acc - 1, rest)
end
