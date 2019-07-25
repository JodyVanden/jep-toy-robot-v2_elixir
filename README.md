# ToyRobot

to run the program
start with `iex -S mix`

```
iex> alias ToyRobot.Game.Player
ToyRobot.Game.Player
iex> robot = %ToyRobot.Robot{north: 0, east: 0, facing: :north}
%ToyRobot.Robot{east: 0, facing: :north, north: 0}
iex> spec = {Player, robot}
{Player, %ToyRobot.Robot{east: 0, facing: :north, north: 0}}
iex> {:ok, sup} = DynamicSupervisor.start_link(strategy: :one_for_one)
{:ok, #PID<0.313.0>}
iex> Player.move(pid("0.338.0"))
%ToyRobot.Simulation{
  robot: %ToyRobot.Robot{east: 0, facing: :north, north: 1},
  table: %ToyRobot.Table{east_boundary: 4, north_boundary: 4}
}
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `toy_robot` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:toy_robot, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/toy_robot](https://hexdocs.pm/toy_robot).

