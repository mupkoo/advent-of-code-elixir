defmodule AdventOfCode.Day5 do
  @vowels ~w{a e i o u}
  @forbidden ~w{ab cd pq xy}

  def parse(input) do
    input
    |> String.split("\n")
    |> Enum.filter(&nice?/1)
    |> Enum.count
  end

  def nice?(child) do
    { true, String.strip(child) }
      |> check_forbidden
      |> check_vowels
      |> check_duplicates
      |> elem(0)
  end

  defp check_forbidden({ _, child }) do
    { !String.contains?(child, @forbidden), child }
  end

  # Return early if the child is not nice
  defp check_vowels({ false, _ } = state), do: state
  defp check_vowels({ true, child }), do: { check_vowels(0, String.to_char_list(child)), child }

  defp check_vowels(3, _), do: true
  defp check_vowels(count, ''), do: count > 2

  defp check_vowels(count, child) do
    case child do
      [?a | rest] -> check_vowels(count + 1, rest)
      [?e | rest] -> check_vowels(count + 1, rest)
      [?i | rest] -> check_vowels(count + 1, rest)
      [?o | rest] -> check_vowels(count + 1, rest)
      [?u | rest] -> check_vowels(count + 1, rest)
      [_  | rest] -> check_vowels(count, rest)
    end
  end


  # Return early if the child is not nice
  defp check_duplicates({ false, _ } = state), do: state
  defp check_duplicates({ true, child }), do: { check_duplicates(false, nil, String.to_char_list(child)), child }

  defp check_duplicates(true, _, _), do: true
  defp check_duplicates(result, _, ''), do: result
  defp check_duplicates(_, prev, [current | rest]), do: check_duplicates(prev == current, current, rest)
end
