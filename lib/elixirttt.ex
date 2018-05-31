defmodule Game do
  @moduledoc """
  Documentation for Game.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Game.hello
      :world

  """
  def play do
    result = 
      [1, 2, 3, 4, 5, 6, 7, 8, 9]
      |> GameLoop.play
    IO.puts Messages.display_board(result)
    IO.puts Messages.end_game(result)
  end
end
