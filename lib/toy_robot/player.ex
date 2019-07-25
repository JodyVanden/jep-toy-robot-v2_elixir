defmodule ToyRobot.Game.Player do
  alias ToyRobot.{Robot, Table, Simulation}
  alias ToyRobot.Game.Player
  use GenServer

  def start_link(robot) do
    GenServer.start_link(__MODULE__, robot)
  end

  def init(robot) do
    simulation = %Simulation{
      table: %Table{
        north_boundary: 4,
        east_boundary: 4,
      },
      robot: robot
    }

    {:ok, simulation}
  end

  def start(robot) do
    GenServer.start(__MODULE__, robot)
  end

  def move(player) do
    GenServer.call(player, :move)
  end

  def report(player) do
    GenServer.call(player, :report)
  end

  def handle_call(:report, _from, simulation) do
    {:reply, simulation |> Simulation.report, simulation}
  end

  def handle_call(:move, _from, simulation) do
    {:ok, new_simulation} = simulation |> Simulation.move
    {:reply, new_simulation, new_simulation}
  end
end