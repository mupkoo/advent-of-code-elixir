defmodule AdventOfCode.Day14 do
  import String, only: [to_integer: 1]

  def parse(input, time \\ 2503) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
    |> Enum.map(&(distance(&1, time)))
    |> Enum.max
  end

  def distance({_, speed, running, resting}, time) do
    lap = running + resting
    remaining = case rem(time, lap) > running do
      true -> running
      false -> rem(time, lap)
    end

    Float.floor(time/lap) * speed * running + remaining * speed
  end

  defp parse_line(line) do
    [deer, "can", "fly", speed, "km/s", "for", running,
     "seconds,", "but", "then", "must", "rest", "for", resting, "seconds."] =
      String.split(line, " ", trim: true)

    {deer, to_integer(speed), to_integer(running), to_integer(resting)}
  end
end
