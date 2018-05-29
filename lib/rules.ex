defmodule Rules do
  import Board, only: [full?: 1]
  @moduledoc """
  Rules for Tic Tac Toe Game
  """
  defp combos(board) do
    [
      MapSet.new([Enum.at(board, 0), Enum.at(board, 1), Enum.at(board, 2)]),
      MapSet.new([Enum.at(board, 3), Enum.at(board, 4), Enum.at(board, 5)]),
      MapSet.new([Enum.at(board, 6), Enum.at(board, 7), Enum.at(board, 8)]),
      MapSet.new([Enum.at(board, 0), Enum.at(board, 3), Enum.at(board, 6)]),
      MapSet.new([Enum.at(board, 1), Enum.at(board, 4), Enum.at(board, 7)]),
      MapSet.new([Enum.at(board, 2), Enum.at(board, 5), Enum.at(board, 8)]),
      MapSet.new([Enum.at(board, 0), Enum.at(board, 4), Enum.at(board, 8)]),
      MapSet.new([Enum.at(board, 2), Enum.at(board, 4), Enum.at(board, 6)])
    ]

  end

  def winner?(board) do
    Enum.any?(combos(board), fn(combo) -> MapSet.size(combo) == 1 end)
  end

  def tie?(board) do
    !winner?(board) && full?(board)  
  end

  def winner(board) do
    result = Enum.reject(combos(board), fn(combo) -> MapSet.size(combo) > 1 end) 
    if result == [] do
      nil
    else
      result
      |> List.first
      |> MapSet.to_list
      |> List.first
    end
  end

  def game_over?(board) do
    winner?(board) || tie?(board)
  end
end
