defmodule AdventOfCode.Day11 do
  @alphabet %{
    "a" => { nil, "b" },
    "b" => { "a", "c" },
    "c" => { "b", "d" },
    "d" => { "c", "e" },
    "e" => { "d", "f" },
    "f" => { "e", "g" },
    "g" => { "f", "h" },
    "h" => { "g", "j" },
    "i" => { "h", "j" },
    "j" => { "i", "k" },
    "k" => { "j", "m" },
    "l" => { "k", "m" },
    "m" => { "l", "n" },
    "n" => { "m", "p" },
    "o" => { "n", "p" },
    "p" => { "o", "q" },
    "q" => { "p", "r" },
    "r" => { "q", "s" },
    "s" => { "r", "t" },
    "t" => { "s", "u" },
    "u" => { "t", "v" },
    "v" => { "u", "w" },
    "w" => { "v", "x" },
    "x" => { "w", "y" },
    "y" => { "x", "z" },
    "z" => { nil, "a" }
  }

  @forbidden ~w{i o l}

  def parse(input) do
    input
    |> String.graphemes
    |> Enum.reverse
    |> next_password
    |> Enum.reverse
    |> Enum.join
  end

  def next_password(current) do
    case valid?(increment(current)) do
      { true, password } -> password
      { false, password } -> next_password(password)
    end
  end

  def increment([char | rest]) do
    case @alphabet[char] do
      { _, "a" }       -> ["a" | increment(rest)]
      { _, next_char } -> [next_char | rest]
    end
  end

  def valid?(password) do
    { true, password }
    |> check_forbidden
    |> check_duplicates
    |> check_sequence
  end

  def check_forbidden({ _, password }) do
    { password -- @forbidden == password, password }
  end

  def check_duplicates({ false, password }), do: { false, password }
  def check_duplicates({ _, password }), do: { duplicates({ 0, [] }, password), password }

  defp duplicates({ 2, _ }, _), do: true
  defp duplicates({ count, matches }, [prev, current | rest]) do
    case !Enum.member?(matches, current) && prev == current do
      true  -> duplicates({ count + 1, [current | matches] }, [current | rest])
      false -> duplicates({ count, matches }, [current | rest])
    end
  end
  defp duplicates(_, _), do: false

  def check_sequence({ false, password }), do: { false, password }
  def check_sequence({ _, password }), do: { sequence(password), password }

  defp sequence([right, current, left | rest]) do
    { left2, right2 } = @alphabet[current]

    case left == left2 && right == right2 do
      false -> sequence([current, left | rest])
      true -> true
    end
  end
  defp sequence(_), do: false
end
