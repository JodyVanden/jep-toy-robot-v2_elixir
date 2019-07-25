defmodule ToyRobot.Game.Players do
  def start_link(args) do
    DynamicSupervisor.start_link(__MODULE__, args)
  end

  def init(_args) do
    DynamicSupervisor.init(strategy: :one_for_one)
    end
end