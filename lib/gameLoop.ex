defmodule GameLoop do
  def play(board) do
    play_round(board, Rules.game_over?(board))
  end

  def play_round(board, false) do
    played_board = TurnController.get_player(board).take_turn(board)
    IO.puts Messages.display_board(played_board)
    play_round(played_board, Rules.game_over?(played_board))
  end

  def play_round(board, true) do
    board
  end
end
