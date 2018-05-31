defmodule Computer do
  import Board
  import Rules

  defimpl Player, for: Computer do
  end

  def take_turn(board) do
    move = 
      board
      |> minimax(0, :x)
    Board.place_marker(board, :x, move) 
  end

  def minimax(board, depth, player) do
    if Rules.game_over?(board) do
      heuristic_value(board)
    else
      possible_moves = board |> Board.available_spaces
      scores_map = Enum.map(possible_moves, fn index -> { index, -1 * minimax(Board.place_marker(board, player, index), depth + 1, swap_player(player)) } end)
                   |> Map.new()
      if (depth == 0), do: best_move(scores_map), else: best_score(scores_map)
    end
  end

  def heuristic_value(board) do
    if Rules.winner?(board), do: -1, else: 0
  end

  def best_move(scores_map) do
    scores_map
    |> Enum.find(fn {_move, score} -> (score == best_score(scores_map)) end)
    |> elem(0)
  end

  def best_score(scores_map) do
    scores_map
    |> Map.values()
    |> Enum.max()
  end

  def swap_player(:x), do: :o
  def swap_player(:o), do: :x
end
