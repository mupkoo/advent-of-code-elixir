defmodule AdventOfCode.Day7 do
  use Bitwise

  def parse(input, wire \\ "a") do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
    |> Enum.into(%{})
    |> resolve_signal(wire)
    |> Map.get(wire)
  end

  def resolve_signal(instructions, wire) do
    case instructions[wire] do
      nil ->
        Map.put(instructions, wire, wire)
      value when is_integer(value) ->
        Map.put(instructions, wire, value)
      value when is_binary(value) ->
        instructions = resolve_signal(instructions, value)
        Map.put(instructions, wire, instructions[value])
      { value } when is_integer(value) ->
        Map.put(instructions, wire, value)
      { value } when is_binary(value) ->
        instructions = resolve_signal(instructions, value)
        Map.put(instructions, wire, instructions[value])
      { "NOT", right } ->
        instructions = resolve_signal(instructions, right)
        Map.put(instructions, wire, bnot(instructions[right]))
      { left, operation, right } ->
        instructions = resolve_signal(instructions, left)
        instructions = resolve_signal(instructions, right)

        left = instructions[left]
        right = instructions[right]

        value = case operation do
          "AND"    -> band(left, right)
          "OR"     -> bor(left, right)
          "LSHIFT" -> bsl(left, right)
          "RSHIFT" -> bsr(left, right)
        end

        Map.put(instructions, wire, value)
    end
  end

  def parse_line(line) do
    line
    |> String.strip
    |> String.split(" -> ", trim: true)
    |> List.update_at(0, &parse_instruction/1)
    |> Enum.reverse
    |> List.to_tuple
  end

  defp parse_instruction(instruction) do
    instruction
    |> String.split(" ", trim: true)
    |> Enum.map(&normalize_instruction/1)
    |> List.to_tuple
  end

  defp normalize_instruction(value) do
    case value =~ ~r/\d+/ do
      true  -> String.to_integer(value)
      false -> value
    end
  end
end
