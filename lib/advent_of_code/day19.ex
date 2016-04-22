defmodule AdventOfCode.Day19 do
  def parse(input) do
    {replacements, initial} = parse_input(input)

    walk([], initial, initial, replacements)
    |> Enum.uniq
    |> length
  end

  def walk(acc, [x, y | rest] = current, all, replacements) do
    prefix = all |> Enum.take(length(all) - length(current)) |> Enum.join
    suffix = rest |> Enum.join

    acc
    |> resolve_replacements(x, prefix, y <> suffix, replacements)
    |> resolve_replacements(x <> y, prefix, suffix, replacements)
    |> walk([y | rest], all, replacements)
  end

  def walk(acc, [x], all, replacements) do
    prefix = all |> Enum.take(length(all) - 1) |> Enum.join

    resolve_replacements(acc, x, prefix, "", replacements)
  end

  def resolve_replacements(acc, current_key, prefix, suffix, replacements) do
    Enum.reduce(replacements, acc, fn ({key, value}, acc) ->
      case key == current_key do
        true -> [prefix <> value <> suffix | acc]
        false -> acc
      end
    end)
  end

  def parse_input(input) do
    [instuctions, initial] = String.split(input, "\n\n", trim: true)

    instuctions = instuctions
      |> String.split("\n", trim: true)
      |> Enum.map(fn (line) ->
        [key, "=>", value] = String.split(line, " ", trim: true)
        {key, value}
      end)

    initial = initial |> String.strip |> String.graphemes

    {instuctions, initial}
  end
end
