defmodule Messages do
  def display_board(board) do
    string_list = 
      board
      |> Enum.map(fn(space) ->
        cond do
          is_atom(space) -> Atom.to_string(space)
          is_integer(space) -> Integer.to_string(space)
        end
      end)
      |> Enum.map(&String.capitalize/1)
    ~s""" 
     #{Enum.at(string_list, 0)} | #{Enum.at(string_list, 1)} | #{Enum.at(string_list, 2)} 
     ==+===+== 
     #{Enum.at(string_list, 3)} | #{Enum.at(string_list, 4)} | #{Enum.at(string_list, 5)} 
     ==+===+== 
     #{Enum.at(string_list, 6)} | #{Enum.at(string_list, 7)} | #{Enum.at(string_list, 8)} 
    """
  end

  def turn_prompt(player) do
    player_string =
      player
      |> Atom.to_string
      |> String.capitalize
    "#{player_string}'s turn to play! Please select an available space."
  end

  def invalid_input do
    "Invalid input detected, please input a number from 1-9"
  end

  def end_game(board) do
    result = Rules.resolve_winner(board)
    cond do
      result == :x -> "X won!"
      result == :o -> "O won!"
      result == :draw -> "It's a tie!"
      result == :no_result -> "Game is not over."
    end
  end

end
