defmodule TurnController do
  require Integer

  def get_player(board) do
    first_player = 
      Board.available_spaces(board)
        |> length
        |> Integer.is_odd
    if (first_player), do: Computer, else: Human
  end
end
