defmodule ToyRobot.Game.PlayersTest do
  use ExUnit.Case, async: true

  alias ToyRobot.{Game.Players, Robot}

  setup do
    {:ok, players} = Players.start_link([])
    {:ok, %{players: players}}
  end

  test "starts a player child process", %{players: players} do
    robot = %Robot{north: 0, east: 0, facing: :north}
    {:ok, _player} = Players.start_child(players, robot)
    %{active: active} = DynamicSupervisor.count_children(players)
    assert active == 1
  end
end
