defmodule AdventOfCode.Day15 do
  import String, only: [to_integer: 1]
  import Enum, only: [at: 2]

  @initial_map %{
    capacities: [],
    durabilities: [],
    flavors: [],
    textures: []
  }

  def parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.reduce(@initial_map, &parse_line/2)
    |> highest
    |> Enum.max
  end

  def highest(data) do
    for x <- 0..100, y <- 0..(100-x), z <- 0..(100-x-y) do
      w = 100 - x - y - z

      capacity   = at(data.capacities, 0) * x + at(data.capacities, 1) * y + at(data.capacities, 2) * z + at(data.capacities, 3) * w
      durability = at(data.durabilities, 0) * x + at(data.durabilities, 1) * y + at(data.durabilities, 2) * z + at(data.durabilities, 3) * w
      flavor     = at(data.flavors, 0) * x + at(data.flavors, 1) * y + at(data.flavors, 2) * z + at(data.flavors, 3) * w
      texture    = at(data.textures, 0) * x + at(data.textures, 1) * y + at(data.textures, 2) * z + at(data.textures, 3) * w

      if capacity < 0,   do: capacity = 0
      if durability < 0, do: durability = 0
      if flavor < 0,     do: flavor = 0
      if texture < 0,    do: texture = 0

      capacity * durability * flavor * texture
    end
  end

  def parse_line(line, map) do
    [_, "capacity", capacity, "durability", durability,
     "flavor", flavor, "texture", texture, "calories", _] =
      String.split(String.replace(line, ",", ""), " ")

    map
    |> Map.update!(:capacities, &([to_integer(capacity) | &1]))
    |> Map.update!(:durabilities, &([to_integer(durability) | &1]))
    |> Map.update!(:flavors, &([to_integer(flavor) | &1]))
    |> Map.update!(:textures, &([to_integer(texture) | &1]))
  end
end
