defmodule ToyRobot.CLI do
  def main([file_name]) do
    if File.exists?(file_name) do
      File.stream!(file_name)
      |> Enum.map(&String.trim/1)
      |> ToyRobot.CommandProcessor.process
      |> ToyRobot.CommandRunner.run
    else
      IO.puts "The file #{file_name} does not exist"
    end
  end

  def main(_) do
    IO.puts "Usage: toy_robot commands.txt"
  end
end
