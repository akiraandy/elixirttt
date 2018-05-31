defmodule MessagesTest do
  use ExUnit.Case
  doctest Messages

  test "displays a 3x3 TTT board" do
    board_string = " 1 | 2 | 3 \n ==+===+== \n 4 | 5 | 6 \n ==+===+== \n 7 | 8 | 9 \n"
    board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    assert Messages.display_board(board) == board_string
    board_string_played = " X | O | 3 \n ==+===+== \n 4 | 5 | 6 \n ==+===+== \n 7 | 8 | 9 \n"
    play_board = [:x, :o, 3, 4, 5, 6, 7, 8, 9]
    assert Messages.display_board(play_board) == board_string_played
  end

  test "prompts the user to take turn" do
    message = "X's turn to play! Please select an available space."
    player = :x
    assert Messages.turn_prompt(player) == message
  end

  test "shows who won" do
    x_wins_board = [:x, :x, :x, 4, 5, 6, 7, 8, 9]
    assert Messages.end_game(x_wins_board) == "X won!"
    o_wins_board = [:o, :o, :o, 4, 5, 6, 7, 8, 9]
    assert Messages.end_game(o_wins_board) == "O won!"
    draw_board = [:x, :o, :x, :x, :o, :o, :o, :x, :x]
    assert Messages.end_game(draw_board) == "It's a tie!"
    board = [1, 2, 3, 4, :o, 6, 7, 8, :x]
    assert Messages.end_game(board) == "Game is not over."
  end
end
